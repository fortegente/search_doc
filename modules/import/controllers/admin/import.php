<?php
class import extends oxAdminView
{
    protected $_sThisTemplate = 'import.tpl';

    protected $_sCsvFilePath = null;

    protected $_mapping = array(
        'oxid'           => 1,
        'marking'        => 0,
        'name'           => 4,
        'changing'       => 8,
        'pages'          => 12,
        'replace_cancel' => 5,
        'replace_name'   => 13,
        'available_from' => 6,
        'available_to'   => 7,
        'decree'         => 14
    );

    public function render()
    {
        $oConfig = $this->getConfig();

        if ($oConfig->getParameter('run')) {
            $this->_prepareAndRunImport();
            $this->_deleteCsvFile();
        }

        return parent::render();
    }

    private function _prepareAndRunImport()
    {
        $result = null;
        $oConfig = $this->getConfig();
        $strDelimeter = $oConfig->getParameter('string_delimeter');
        $fieldDelimeter = $oConfig->getParameter('field_delimeter');

        if ($_FILES['csvfile']['name'] && $strDelimeter && $fieldDelimeter) {
            $this->run($strDelimeter, $fieldDelimeter);
        } else {
            $oEx = oxNew( "oxExceptionToDisplay" );
            $oEx->setMessage('DOCS_ERRORUPLOADINGFILE');
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx, false, true, 'docimport' );
        }

        return $result;
    }

    public function run($strDelimeter, $fieldDelimeter)
    {
        $this->_prepareDataForImport($this->_getUploadedCsvFilePath(), $strDelimeter, $fieldDelimeter);
        $this->doImport();
    }

    protected function _getUploadedCsvFilePath()
    {
        if ( $this->_sCsvFilePath !== null ) {
            return $this->_sCsvFilePath;
        }

        $oConfig = $this->getConfig();
        $aFile = $oConfig->getUploadedFile( 'csvfile' );

        if (isset($aFile['name']) && $aFile['name']) {
            $this->_sCsvFilePath = $oConfig->getConfigParam('sCompileDir') . basename($aFile['tmp_name']);
            move_uploaded_file($aFile['tmp_name'], $this->_sCsvFilePath);

            return $this->_sCsvFilePath;
        }
    }

    public function doImport()
    {
        if (!count($this->_aData)) {
            $oEx = oxNew( "oxExceptionToDisplay" );
            $oEx->setMessage('DOCS_EMPTY_FILE');
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx, false, true, 'docimport' );

            return;
        }

        $result = $this->_insertDocumentsToDatabase();
        $this->_aViewData['result'] = $result;
    }

    private function _prepareDataForImport($sPath, $strDelimeter, $fieldDelimeter)
    {
        $iMaxLineLength = 8192;
        $file = @fopen($sPath, "r");

        if (isset($file) && $file) {
            while (($aRow = fgetcsv( $file, $iMaxLineLength, $fieldDelimeter, $strDelimeter)) !== false ) {
                if (!$this->_aData) {
                    $this->_aData[] = $aRow;
                    continue;
                }

                $lastElement = $this->_aData[count($this->_aData) - 1];

                if (count($aRow) < 17 || count($lastElement) < 17) {
                    if (count($lastElement) < 17) {
                        $firstEl = array_shift($aRow);
                        $lastCell = $lastElement[count($lastElement) - 1];
                        $lastElement[count($lastElement) - 1] = $lastCell . "\r\n " . $firstEl;
                        $this->_aData[count($this->_aData) - 1] = $lastElement;

                        foreach ($aRow as $value) {
                            array_push($this->_aData[count($this->_aData) - 1], $value);
                        }
                    } else {
                        $this->_aData[] = $aRow;
                    }
                } else {
                    $this->_aData[] = $aRow;
                }
            }
            array_shift($this->_aData);

        } else {
            $oEx = oxNew( "oxExceptionToDisplay" );
            $oEx->setMessage('DOCS_ERROR_UPLOAD_FILE');
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx, false, true, 'docimport' );
        }

        @fclose($file);
    }

    private function _insertDocumentsToDatabase()
    {
        $firstItemSkip = true;
        $oDb = oxDb::getDb();
        $mapping = $this->_mapping;
        $count = 0;

        foreach ($this->_aData as $value) {
            if ($firstItemSkip) {
                $firstItemSkip = false;
                continue;
            }
            $sSql = "INSERT INTO zsdocuments (oxid, marking, name, changing, pages, state, replace_cancel, replace_name, available_from, available_to, decree)
                     VALUES(" .
                                $oDb->quote($value[$mapping['oxid']]) . "," .
                                $oDb->quote($value[$mapping['marking']]) . "," .
                                $oDb->quote($value[$mapping['name']]) . "," .
                                $oDb->quote($value[$mapping['changing']]) . "," .
                                $oDb->quote($value[$mapping['pages']]) . "," .
                                "'Діє'," .
                                $oDb->quote($value[$mapping['replace_cancel']]) . "," .
                                $oDb->quote($value[$mapping['replace_name']]) . "," .
                                $oDb->quote($value[$mapping['available_from']]) . "," .
                                $oDb->quote($value[$mapping['available_to']]) . "," .
                                $oDb->quote($value[$mapping['decree']]) .
                    ")
                     ON DUPLICATE KEY UPDATE
                                marking = " . $oDb->quote($value[$mapping['marking']]) . ",
                                name = " . $oDb->quote($value[$mapping['name']]) . ",
                                changing = " . $oDb->quote($value[$mapping['changing']]) . ",
                                pages = " . $oDb->quote($value[$mapping['pages']]) . ",
                                state = 'Діє',
                                replace_cancel = " . $oDb->quote($value[$mapping['replace_cancel']]) . ",
                                replace_name = " . $oDb->quote($value[$mapping['replace_name']]) . ",
                                available_from = " . $oDb->quote($value[$mapping['available_from']]) . ",
                                available_to = " . $oDb->quote($value[$mapping['available_to']]) . ",
                                decree = " . $oDb->quote($value[$mapping['decree']]);
            $oDb->execute( $sSql );
            $count++;
        }

        return $count;
    }

    protected function _deleteCsvFile()
    {
        $sPath = $this->_getUploadedCsvFilePath();
        if ( is_file( $sPath ) ) {
            @unlink( $sPath );
        }
    }
}