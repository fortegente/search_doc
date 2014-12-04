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
        $this->setBody($this->_getApprovePaymentHtml($oUser, $group));
        $this->setSubject('Підтвердження оплати');

        $this->setRecipient($oUser->oxuser__oxusername->value, "");
        $this->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        return $this->send();
    }

    public function sendNotificationAboutProlong($payPeriod, $oUser)
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);
        $this->setBody($this->_getProlongPaymentHtml($oUser, $payPeriod));
        $this->setSubject('Пролонгація акаунту');

        $this->setRecipient($oUser->oxuser__oxusername->value, "");
        $this->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        return $this->send();
    }

    public function sendNotificationAboutChangeAcount($payPeriod, $oUser)
    {
        $oShop = $this->_getShop();
        $this->_setMailParams($oShop);
        $this->setBody($this->_getChangeAcountHtml($oUser, $payPeriod));
        $this->setSubject('Зміна тарифного плану');

        $this->setRecipient($oUser->oxuser__oxusername->value, "");
        $this->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        return $this->send();
    }

    private function _getProlongPaymentHtml($oUser, $payPeriod)
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
      <title>Пролонгація акаунту</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>

  <body bgcolor="#ffffff" link="#355222" alink="#18778E" vlink="#389CB4" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">

    <div width="600" style="width: 600px">

        <div style="padding: 10px 0;">
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0" />
        </div>
        Шановний $userName!<br>
        Ви успішно змінили свій тарифний план на standart-profi.<br>
        Термін користування вибраний Вами становить $payPeriod місяців.<br>
        На Ваш е-mail відправлено рахунок на оплату інформаційних послуг за обраний Вами період.<br>
        Підчас оплати обов’язково вкажіть номер рахунку - власне номер<br>
        В разі потреби оформлення договору та актів виконаних робіт надішліть будь ласка Вашу адресу для листування.<br>

        Дякуємо що Ви скористались нашими послугами.<br>
        Бажаємо успіхів в роботі з найсучаснішою інформаціно-пошуковою<br>
        системою нормативних документів в Україні!<br><br>

        З повагою, команда standart-info!
    </div>
  </body>
</html>
EOT;
        return $html;
    }

    private function _getChangeAcountHtml($oUser, $payPeriod)
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
      <title>Пролонгація акаунту</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>

  <body bgcolor="#ffffff" link="#355222" alink="#18778E" vlink="#389CB4" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">

    <div width="600" style="width: 600px">

        <div style="padding: 10px 0;">
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0" />
        </div>
        Шановний $userName!<br>
        Пролонгація акаунту в системі standart-info профі пройшла успішно.<br>
        Термін користування вибраний Вами становить $payPeriod місяців.<br>
        На Ваш е-mail відправлено рахунок на оплату інформаційних послуг за обраний Вами період.<br>
        Підчас оплати обов’язково вкажіть номер рахунку - власне номер<br>

        Дякуємо що Ви скористались нашими послугами.<br>
        Бажаємо успіхів в роботі з найсучаснішою інформаціно-пошуковою<br>
        системою нормативних документів в Україні!<br><br>

        З повагою, команда standart-info!
    </div>
  </body>
</html>
EOT;
        return $html;
    }

    private function _getApprovePaymentHtml($oUser)
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
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0" />
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