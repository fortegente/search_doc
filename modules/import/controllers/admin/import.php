<?php
class import extends oxAdminView
{
    protected $_sThisTemplate = 'import.tpl';

    protected $_sCsvFilePath = null;

    public function run()
    {
        $oConfig = $this->getConfig();
        $strDelimeter = $oConfig->getParameter('string_delimeter');
        $fieldDelimeter = "#";

        $this->doImport($this->_getUploadedCsvFilePath(), $strDelimeter, $fieldDelimeter);
        $this->_aViewData['iTotalRows'] = 111;//$oErpImport->getTotalImportedRowsNumber();

        //checking if errors occured during import
       // $this->_checkImportErrors( $oErpImport );

        //deleting uploaded csv file from temp dir
        //$this->_deleteCsvFile();

        //check if repeating import - then forsing first step
        if ( $oConfig->getParameter( 'iRepeatImport' ) ) {
            $this->_aViewData['iRepeatImport'] = 1;
            $sNavStep = 1;
        }
    }

    protected function _getUploadedCsvFilePath()
    {
        //try to get uploaded csv file path
//        if ( $this->_sCsvFilePath !== null ) {
//            return $this->_sCsvFilePath;
//        } elseif ( $this->_sCsvFilePath = oxSession::getVar( 'sCsvFilePath' ) ) {
//            return $this->_sCsvFilePath;
//        }

        $oConfig = $this->getConfig();
        $aFile = $oConfig->getUploadedFile( 'csvfile' );
        if (isset($aFile['name']) && $aFile['name']) {
            $this->_sCsvFilePath = $oConfig->getConfigParam('sCompileDir') . basename($aFile['tmp_name']);
            move_uploaded_file($aFile['tmp_name'], $this->_sCsvFilePath);
            //oxSession::setVar('sCsvFilePath', $this->_sCsvFilePath);

            return $this->_sCsvFilePath;
        }
    }

    public function doImport($sPath = null, $strDelimeter, $fieldDelimeter)
    {
        $myConfig = oxRegistry::getConfig();
        $mySession = oxRegistry::getSession();

        $this->_sReturn = "";
        $iMaxLineLength = 8192;
        $file = @fopen($sPath, "r");

        if (isset($file) && $file) {
            $iRow = 0;
            $aRow = array();

          //  while (($aRow = fgetcsv( $file, $iMaxLineLength, $fieldDelimeter, $strDelimeter)) !== false ) {
          //      $a = 1111;
                //$this->_aData[] = $aRow;
           // }

//            if ( $this->_blCsvContainsHeader ) {
//                //skipping first row - it's header
//                array_shift( $this->_aData );
//            }

            try {

            } catch (Exception $ex) {
                echo $ex->getMessage();
                $this->_sReturn = 'ERPGENIMPORT_ERROR_DURING_IMPORT';
            }

        } else {
            $this->_sReturn = 'ERPGENIMPORT_ERROR_WRONG_FILE';
        }

        @fclose($file);

        return $this->_sReturn;
    }
}