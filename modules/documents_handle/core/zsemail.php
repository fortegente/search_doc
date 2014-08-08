<?php
class zsEmail extends zsEmail_parent
{
    public function sendNotificationAboutDocumentsChange()
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);

        $this->setBody('test');
        $this->setSubject('subject');

        $this->setRecipient('fortegente@gmail.com', "");
        $this->setFrom('fortegente@gmail.com', $oShop->oxshops__oxname->getRawValue());
        $this->setReplyTo("fortegente@gmail.com", "");

        return $this->send();
    }
}