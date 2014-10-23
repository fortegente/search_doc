<?php
class zsEmail extends zsEmail_parent
{
    protected $_oSmarty = null;

    protected $_modifyDocumentNotificationTemplate = "email/html/modifyDocumentNotification.tpl";

    public function sendNotificationAboutDocumentsChange($userEmail)
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);
        $oSmarty = $this->_getSmarty();
        $this->setBody($oSmarty->fetch( $this->_modifyDocumentNotificationTemplate ));
        $this->setSubject('subject');

        $this->setRecipient($userEmail, "");
        $this->setFrom('fortegente@gmail.com', $oShop->oxshops__oxname->getRawValue());
        $this->setReplyTo("fortegente@gmail.com", "");

        return $this->send();
    }

    protected function _getSmarty()
    {
        if ( $this->_oSmarty === null ) {
            $this->_oSmarty = oxRegistry::get("oxUtilsView")->getSmarty();
        }

        //setting default view
        $this->_oSmarty->assign( "oEmailView", $this );

        return $this->_oSmarty;
    }
}