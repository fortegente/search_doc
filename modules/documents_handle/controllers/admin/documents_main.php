<?php
class Documents_Main extends oxAdminDetails
{
    private $_sSaveError = null;

    public function render()
    {
        parent::render();

        $soxId = $this->_aViewData["oxid"] = $this->getEditObjectId();

        if ( $soxId != "-1" && isset( $soxId ) ) {
            $oUser = oxNew( "zsdocuments" );
            $oUser->load( $soxId);
            $this->_aViewData["edit"] =  $oUser;
        }

        if (!$this->_allowAdminEdit($soxId)) {
            $this->_aViewData['readonly'] = true;
        }

        if ($this->_sSaveError) {
            $this->_aViewData["sSaveError"] = $this->_sSaveError;
        }

        return "documents_main.tpl";
    }

    public function save()
    {
        parent::save();
        $soxId = $this->getEditObjectId();
        $aParams    = oxConfig::getParameter( "editval");
        $oDocuments = oxNew("zsdocuments");

        if ( $soxId != "-1") {
            $oDocuments->load($soxId);
        } else {
            if ($oDocuments->checkEmptyField($aParams['zsdocuments__oxid'])) {
                $this->_sSaveError = 'DOC_EMPTY_FIELD';
                return;
            }

            if ($oDocuments->checkIfDocumentExists($aParams['zsdocuments__oxid'])) {
                $this->_sSaveError = 'DOC_EXISTS';
                return;
            }
        }

        $oDocuments->assign( $aParams);
        $oDocuments->save();
        $this->setEditObjectId( $oDocuments->getId() );
    }
}