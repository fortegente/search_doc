<?php
class import extends oxAdminView
{
    protected $_sThisTemplate = 'import.tpl';

    protected $_documentsInDb = array();

    protected $_changedDocumentsId = array();

    protected $_isCancelUpdate = 0;

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
            $this->_run();
        }

        return parent::render();
    }

    private function _run()
    {
        $this->_beforeImport();
        $this->_import();
        $this->_afterImport();
    }

    private function _beforeImport()
    {
        $oConfig = $this->getConfig();
        $strDelimeter = $oConfig->getParameter('string_delimeter');
        $fieldDelimeter = $oConfig->getParameter('field_delimeter');
        $isCancelUpdate = $oConfig->getParameter('cancel');
        $this->_isCancelUpdate = $isCancelUpdate ? 1 : 0;

        if ($_FILES['csvfile']['name'] && $strDelimeter && $fieldDelimeter) {
            $this->_prepareDataForImport($this->_getUploadedCsvFilePath(), $strDelimeter, $fieldDelimeter);
            if (count($this->_aData)) {
                $this->_getAllDocumentsFromDb();
            }
        } else {
            $oEx = oxNew( "oxExceptionToDisplay" );
            $oEx->setMessage('DOCS_ERRORUPLOADINGFILE');
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx, false, true, 'docimport' );
        }
    }

    private function _import()
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

    protected function _afterImport()
    {
        foreach ($this->_changedDocumentsId as $documentId) {
            $oDocuments = oxNew("zsDocuments");
            $oDocuments->sendNotificationToUser($documentId);
        }

        $this->_deleteCsvFile();
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

    private function _getAllDocumentsFromDb()
    {
        $oDb = oxDb::getDb();

        if (!$this->_isCancelUpdate) {
            $sQ = "select oxid, marking, name, changing, pages, replace_cancel, replace_name, available_from, available_to, decree from zsdocuments";
        } else {
            $sQ = "select oxid, state from zsdocuments";
        }

        $result = $oDb->getAssoc($sQ);

        foreach ($result as $oxid => $values) {
            $this->_documentsInDb[trim($oxid)] = $values;
        }
    }

    private function _prepareDataForImport($sPath, $strDelimeter, $fieldDelimeter)
    {
        $iMaxLineLength = 8192;
        $file = @fopen($sPath, "r");
        $i = 0;

        if (isset($file) && $file) {
            while (($aRow = fgetcsv( $file, $iMaxLineLength, $fieldDelimeter, $strDelimeter)) !== false ) {
                if ($i == 0) {$i++;continue;}
                $this->_aData[] = $aRow;
            }

            if (count($this->_aData)) {
                array_shift($this->_aData);
            }
        } else {
            $oEx = oxNew( "oxExceptionToDisplay" );
            $oEx->setMessage('DOCS_ERROR_UPLOAD_FILE');
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( $oEx, false, true, 'docimport' );
        }

        @fclose($file);
    }

    private function _insertDocumentsToDatabase()
    {
        $oDb = oxDb::getDb();
        $mapping = $this->_mapping;
        $count = 0;
        $alreadyInsertedId = array();

        foreach ($this->_aData as $value) {
            $isChanged = $this->_checkIfDocumentsChanged($value);

            if ($isChanged) {
                if (!$this->_isCancelUpdate) {
                    $sSql = "INSERT INTO zsdocuments (oxid, marking, name, changing, pages, state, replace_cancel, replace_name, available_from, available_to, decree)
                     VALUES(" .
                        $oDb->quote(trim($value[$mapping['oxid']])) . "," .
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
                } else {
                   if (in_array(trim($value[0]), $alreadyInsertedId)) {
                       continue;
                   }

                   if (in_array(trim($value[0]), $this->_changedDocumentsId)) {
                       $sSql = "UPDATE zsdocuments SET state='Не діє', replace_name=" . $oDb->quote($value[1]) . " WHERE oxid = " . $oDb->quote(trim($value[0]));
                   } else {
                       $alreadyInsertedId[] = trim($value[0]);
                       $sSql = "INSERT INTO zsdocuments (oxid, marking, name, changing, pages, state, replace_cancel, replace_name, available_from, available_to, decree, decree_cancel)
                 VALUES(" .
                       $oDb->quote(trim($value[0])) . ", '', '', '', '', 'Не діє', '', " . $oDb->quote($value[1]) . ", '', '', '', " . $oDb->quote($value[3]) . ")";
                   }
                }
                $oDb->execute( $sSql );
                $count++;
            }
        }

        return $count;
    }

    protected function _checkIfDocumentsChanged($newDocumentData)
    {
        $documentsInDb = $this->_documentsInDb;

        if (!$this->_isCancelUpdate) {
            $dbFieldsMapping = array('marking', 'name', 'changing', 'pages', 'replace_cancel', 'replace_name', 'available_from', 'available_to', 'decree');
            $mapping = $this->_mapping;
            $currentDocId = trim($newDocumentData[$mapping['oxid']]);
            if (isset($documentsInDb[$currentDocId])) {
                $docToCheck = $documentsInDb[$currentDocId];

                foreach ($docToCheck as $key => $fieldInDb) {
                    if (md5($fieldInDb) != md5($newDocumentData[$mapping[$dbFieldsMapping[$key]]])) {
                        $this->_changedDocumentsId[] = $currentDocId;
                        return true;
                    }
                }
            } else {
                return true;
            }
        } else {
            $currentDocId = trim($newDocumentData[0]);
            if (strlen($currentDocId) > 250) {
                return;
            }

            if (isset($documentsInDb[$currentDocId])) {
                if (md5($documentsInDb[$currentDocId]) != md5('Не діє')) {
                    $this->_changedDocumentsId[] = $currentDocId;

                    return true;
                }
            } else {
                return true;
            }
        }
    }

    protected function _deleteCsvFile()
    {
        $sPath = $this->_getUploadedCsvFilePath();
        if ( is_file( $sPath ) ) {
            @unlink( $sPath );
        }
    }
}