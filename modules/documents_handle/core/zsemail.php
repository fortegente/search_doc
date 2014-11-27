<?php
class zsEmail extends zsEmail_parent
{
    protected $_oSmarty = null;

    protected $_modifyDocumentNotificationTemplate = "email/html/modifyDocumentNotification.tpl";

    public function sendNotificationAboutDocumentsChange($userEmail)
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);
        $this->setBody($this->_getEmailHtml());
        $this->setSubject('інформація про змінені документи');

        $this->setRecipient($userEmail, "");
        $this->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        return $this->send();
    }

    public function sendNotificationAboutApprovePayment($oUser, $group)
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);
        $this->setBody($this->_getApprovePaimentHtml($oUser, $group));
        $this->setSubject('Підтвердження оплати');

        $this->setRecipient($oUser->oxuser__oxusername->value, "");
        $this->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        return $this->send();
    }

    private function _getApprovePaimentHtml($oUser)
    {
        if ($oUser->oxuser__is_company->value) {
            $userName = $oUser->oxuser__oxlname->value;
        } else {
            $userName = $oUser->oxuser__oxfname->value . " " . $oUser->oxuser__oxlname->value;
        }
        $oViewConf = oxNew( 'oxViewConfig' );
        $html = <<<EOT
<!DOCTYPE HTML>
<html>
  <head>
      <title>Підтвердження оплати</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>

  <body bgcolor="#ffffff" link="#355222" alink="#18778E" vlink="#389CB4" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">

    <div width="600" style="width: 600px">

        <div style="padding: 10px 0;">
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0"" align="texttop">
        </div>
        Шановний $userName!<br>
        Оплата в системі standart-info профі пройшла успішно.<br>
        Термін користування оплачений Вами становить $oUser->oxuser__zs_pay_duration місяців.<br>
        Приемного користування!<br><br>

        З повагою команда standart-info.
    </div>
  </body>
</html>
EOT;
        return $html;

    }

    private function _getEmailHtml()
    {
        $oViewConf = oxNew( 'oxViewConfig' );
        $html = <<<EOT
<!DOCTYPE HTML>
<html>
  <head>
      <title>інформація про змінені документи</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>

  <body bgcolor="#ffffff" link="#355222" alink="#18778E" vlink="#389CB4" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">

    <div width="600" style="width: 600px">

        <div style="padding: 10px 0;">
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0"" align="texttop">
        </div>
        Спішимо повідомити що деякі документы с Вашої базы були змінені. <br>
        Ознайомитися з даною інформацією Ви можете перейшовши по <a target='_blank' href='http://standart-info.com'>посиланню</a><br><br>

        З повагою команда standart-info.
    </div>

  </body>
</html>
EOT;
return $html;

    }
}