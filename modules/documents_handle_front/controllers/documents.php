<?php
class documents extends oxUBase
{
    protected $_sThisTemplate = 'documents.tpl';

    protected $_oDocumentsList = null;

    protected $_oPageNavigation = null;

    protected $_iCntPages = 0;

    protected $_documentsPerPage = 20;

    protected $_blSaveStatus = null;

    public function render()
    {
        if ($searchParam = oxConfig::getParameter('searchparam')) {
            $this->_aViewData["searchparam"] = $searchParam;
        }

        if ($searchCategory = oxConfig::getParameter('search_category')) {
            $this->_aViewData["search_category"] = $searchCategory;
        }

        return parent::render();
    }

    public function getDocumentsList()
    {
        $sSearchParam = oxConfig::getParameter('searchparam');

        if ($sSearchParam) {
            return $this->_getSearchDocumentsList($sSearchParam);
        }

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

    private function _getSearchDocumentsList($sSearchParam)
    {
        $oDocumentsList = oxNew("zsDocumentslist");
        $oDocumentsList->init("zsDocuments");
        $sSearchCategory = oxConfig::getParameter('search_category');

        $oDocumentsList->getSearchDocumentsList($sSearchParam, $sSearchCategory, $this->getActPage() * $this->_documentsPerPage);
        $this->_iCntPages = ceil($oDocumentsList->count() / $this->_documentsPerPage);

        return $oDocumentsList;
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

    public function addFavouriteDocuments()
    {
        $aParams = oxConfig::getParameter('favourite_docs');

        if (!$aParams) {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay('DOCS_EMPTY_FAVOURITE');
            return false;
        }

        $oUserToDocuments = oxNew('zsUser2Documents');

        if ($oUserToDocuments->save($aParams)) {
            $this->_blSaveStatus = 1;
        } else {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay('DOCS_FAILED_SAVE');
        }
    }

    public function getSaveStatus()
    {
        return $this->_blSaveStatus;
    }

    public function generatePageNavigation( $iPositionCount = 0 )
    {
        startProfile('generatePageNavigation');

        $pageNavigation = new stdClass();

        $pageNavigation->NrOfPages = $this->_iCntPages;
        $iActPage = $this->getActPage();
        $pageNavigation->actPage   = $iActPage + 1;
        $sUrl = preg_replace("/&amp;fnc=addFavouriteDocuments/", "", $this->generatePageNavigationUrl());

        if ( $iPositionCount == 0 || ($iPositionCount >= $pageNavigation->NrOfPages) ) {
            $iStartNo = 2;
            $iFinishNo = $pageNavigation->NrOfPages;
            $bStart = false;
            $bFinish =false;
        } else {
            $iTmpVal = $iPositionCount - 3;
            $iTmpVal2 = floor( ( $iPositionCount - 4 ) / 2 );

            // actual page is at the start
            if ( $pageNavigation->actPage <= $iTmpVal ) {
                $iStartNo = 2;
                $iFinishNo = $iTmpVal + 1;
                $bStart = false;
                $bFinish = true;
                // actual page is at the end
            } elseif ( $pageNavigation->actPage >= $pageNavigation->NrOfPages - $iTmpVal ) {
                $iStartNo = $pageNavigation->NrOfPages - $iTmpVal;
                $iFinishNo = $pageNavigation->NrOfPages - 1;
                $bStart = true;
                $bFinish = false;
                // actual page is in the midle
            } else {
                $iStartNo = $pageNavigation->actPage - $iTmpVal2;
                $iFinishNo = $pageNavigation->actPage + $iTmpVal2;
                $bStart = true;
                $bFinish = true;
            }
        }

        if ( $iActPage > 0) {
            $pageNavigation->previousPage = $this->_addPageNrParam( $sUrl, $iActPage - 1 );
        }

        if ( $iActPage < $pageNavigation->NrOfPages - 1 ) {
            $pageNavigation->nextPage = $this->_addPageNrParam( $sUrl, $iActPage + 1 );
        }

        if ( $pageNavigation->NrOfPages > 1 ) {

            for ( $i=1; $i < $pageNavigation->NrOfPages + 1; $i++ ) {

                if ( $i == 1 || $i == $pageNavigation->NrOfPages || ( $i >= $iStartNo && $i <= $iFinishNo ) ) {
                    $page = new stdClass();
                    $page->url = $this->_addPageNrParam( $sUrl, $i - 1 );
                    $page->selected = ( $i == $pageNavigation->actPage ) ? 1 : 0;
                    $pageNavigation->changePage[$i] = $page;
                }
            }

            // first/last one
            $pageNavigation->firstpage = $this->_addPageNrParam( $sUrl, 0 );
            $pageNavigation->lastpage  = $this->_addPageNrParam( $sUrl, $pageNavigation->NrOfPages - 1 );
        }

        stopProfile('generatePageNavigation');

        return $pageNavigation;
    }
}