<?php
class zsaccount_documents extends Account
{
    protected $_sThisTemplate = 'account_documents.tpl';

    protected $_aDocumentsList = array();

    protected $_oPageNavigation = null;

    protected $_iCntPages = 0;

    protected $_documentsPerPage = 20;

    protected $_blRemoveStatus = null;

    public function getUserDocumentsList()
    {
        if (!$this->_aDocumentsList) {
            $oUserToDocuments = oxNew('zsUser2Documents');

            if ($iCnt = $oUserToDocuments->getCount()) {
                $this->_iCntPages = ceil($iCnt / $this->_documentsPerPage);
                $this->_aDocumentsList = $oUserToDocuments->getUserDocuments($this->getActPage() * $this->_documentsPerPage);;
            }
        }

        $this->_updateReviewDate();

        return $this->_aDocumentsList;
    }

    private function _updateReviewDate()
    {
        $oUserToDocuments = oxNew('zsUser2Documents');

        if ($this->_aDocumentsList) {
            foreach ($this->_aDocumentsList as $oDocument) {
                $oUserToDocuments->updateReviewDate($oDocument->zsdocuments__oxid->value);
            }
        }
    }

    public function removeFromFavouriteDocuments()
    {
        $aParams = oxConfig::getParameter('remove_doc');
        $oUserToDocuments = oxNew('zsUser2Documents');

        if ($oUserToDocuments->removeUserDocument($aParams)) {
            $this->_blRemoveStatus = 1;
        }
    }

    public function getRemoveStatus()
    {
        return $this->_blRemoveStatus;
    }

    public function getPageNavigation()
    {
        if ($this->_oPageNavigation === null) {
            $this->_oPageNavigation = false;
            $this->_oPageNavigation = $this->generatePageNavigation();
        }

        return $this->_oPageNavigation;
    }

    public function generatePageNavigation( $iPositionCount = 0 )
    {
        startProfile('generatePageNavigation');

        $pageNavigation = new stdClass();

        $pageNavigation->NrOfPages = $this->_iCntPages;
        $iActPage = $this->getActPage();
        $pageNavigation->actPage   = $iActPage + 1;
        $sUrl = preg_replace("/&amp;fnc=removeFromFavouriteDocuments/", "", $this->generatePageNavigationUrl());

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

    public function isDocumentChangeFromLastVisit($lastSeenDate, $lastUpdateDate)
    {
        return strtotime($lastUpdateDate) > strtotime($lastSeenDate);
    }
}