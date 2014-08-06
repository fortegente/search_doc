<?php
class documents extends oxUBase
{
    protected $_sThisTemplate = 'documents.tpl';

    protected $_oDocumentsList = null;

    protected $_oPageNavigation = null;

    protected $_iCntPages = 0;

    protected $_documentsPerPage = 20;

    public function getDocumentsList()
    {
        if ( $this->_oDocumentsList === null ) {
            $oDocumentsList = oxNew("zsDocumentslist");
            $oDocumentsList->init("zsDocuments");

            if ($iCnt = $oDocumentsList->getCount()) {
                $this->_iCntPages = ceil($iCnt / $this->_documentsPerPage);

                $oDocumentsList->getDocumentsList($this->getActPage() * $this->_documentsPerPage);
                $this->_oDocumentsList = $oDocumentsList;
            }
        }

        return $this->_oDocumentsList;
    }

    public function checkExpiredDateForPayment($paymentDate, $paymentDuration)
    {
        $dueDate = strtotime('-' . $paymentDuration . 'month');

        if (strtotime($paymentDate) < $dueDate) {
            return true;
        }
    }

    public function getPageNavigation()
    {
        if ($this->_oPageNavigation === null) {
            $this->_oPageNavigation = false;
            $this->_oPageNavigation = $this->generatePageNavigation();
        }

        return $this->_oPageNavigation;
    }
}