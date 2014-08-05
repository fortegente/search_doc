<?php
class zsUser_Main extends zsUser_Main_parent
{
    public function render()
    {
        $sTemplate = parent::render();
        $this->_aViewData["pay_duration"] = array('', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);

         return $sTemplate;
    }

    public function save()
    {
        //allow admin information edit only for MALL admins
        $soxId = $this->getEditObjectId();
        if ( $this->_allowAdminEdit( $soxId ) ) {

            $aParams = oxConfig::getParameter( "editval");

            // checkbox handling
            if ( !isset( $aParams['oxuser__oxactive'] ) ) {
                $aParams['oxuser__oxactive'] = 0;
            }

            $oUser = oxNew( "oxuser" );

            if ( $soxId != "-1" ) {
                $oUser->load( $soxId );
            } else {
                $aParams['oxuser__oxid'] = null;
            }

            //setting new password
            if ( ( $sNewPass = oxConfig::getParameter( "newPassword" ) ) ) {
                $oUser->setPassword( $sNewPass );
            }

            //FS#2167 V checks for already used email
            if ( $oUser->checkIfEmailExists( $aParams['oxuser__oxusername'] ) ) {
                $this->_sSaveError = 'EXCEPTION_USER_USEREXISTS';
                return;
            }


            if (($aParams['oxuser__zs_pay_duration'] && $aParams['oxuser__oxid'] && !$oUser->oxuser__zs_pay_date->value) ||
                ($aParams['oxuser__zs_pay_duration'] && $aParams['update_pay_date'])) {
                $aParams['oxuser__zs_pay_date'] = date('Y-m-d');
            } elseif (!$aParams['oxuser__zs_pay_duration']) {
                $aParams['oxuser__zs_pay_date'] = null;
            }

            $oUser->assign( $aParams );


            // A. changing field type to save birth date correctly
            $oUser->oxuser__oxbirthdate->fldtype = 'char';

            try {
                $oUser->save();

                // set oxid if inserted
                $this->setEditObjectId( $oUser->getId() );
            } catch ( Exception $oExcp ) {
                $this->_sSaveError = $oExcp->getMessage();
            }
        }
    }
}