<?php
class zsCataloglist extends oxList
{
    public function __construct( $sObjectsInListName = 'zscatalog')
    {
        parent::__construct( 'zscatalog');
    }

    public function getCatalogList($group = null, $subgroup = null, $documents = null)
    {
        $catalogTree = $this->_buildCatalogTree();
        $result = array();
        $listCollection = $this->getList();

        foreach ($listCollection as $catalogItem) {
            $idComponents = explode('.', $catalogItem->zscatalog__oxid);
            if (!$group) {
                if (count($idComponents) == 1) {
                    $result[] = array('id'    => $catalogItem->zscatalog__oxid,
                                      'title' => $catalogItem->zscatalog__title,
                                      'qnt'   => count($catalogTree[$catalogItem->zscatalog__oxid->value]['info']),
                                      'text'  => oxRegistry::getLang()->translateString('DOC_SUB_IS_CATALOG', oxRegistry::getLang()->getBaseLanguage(), false));
                }
            } elseif ($group && $subgroup) {
                if (count($idComponents) == 3 && $idComponents[0] == $group && $idComponents[1] == $subgroup) {
                    $result[] = array('id'    => $catalogItem->zscatalog__oxid,
                                      'title' => $catalogItem->zscatalog__title,
                                      'qnt'   => $this->_getQntDocumentsInCategory($catalogItem->zscatalog__oxid),
                                      'text'  => oxRegistry::getLang()->translateString('DOC_SUB_IS_DOCUMENTS', oxRegistry::getLang()->getBaseLanguage(), false));
                }
            } elseif ($group) {
                if (count($idComponents) == 2 && $idComponents[0] == $group) {
                    $runToDocuments = false;
                    $customText = oxRegistry::getLang()->translateString('DOC_SUB_IS_SUBCATALOG', oxRegistry::getLang()->getBaseLanguage(), false);;
                    $qntCategories = count($catalogTree[$idComponents[0]]['info'][$idComponents[1]]['info']);

                    if ($qntCategories == 0) {
                        $runToDocuments = true;
                        $customText = oxRegistry::getLang()->translateString('DOC_SUB_IS_DOCUMENTS', oxRegistry::getLang()->getBaseLanguage(), false);
                        $qntCategories = $this->_getQntDocumentsInCategory($catalogItem->zscatalog__oxid);
                    }

                    $result[] = array('id'                => $catalogItem->zscatalog__oxid,
                                      'title'             => $catalogItem->zscatalog__title,
                                      'qnt'               => $qntCategories,
                                      'text'              => $customText,
                                      'runToDocuments'    => $runToDocuments);
                }
            }
        }

        return $result;
    }

    private function _buildCatalogTree()
    {
        $oDb = oxDb::getDb();
        $sQ = "select * from zscatalog order by oxid";
        $catalogCollection = $oDb->getAll($sQ);

        foreach ($catalogCollection as $catalogItem) {
            $info = explode('.', $catalogItem[0]);
            if (count($info) == 1) {
                $collection[$info[0]] = array($catalogItem[1], 'info' => array());
            }

            if (count($info) == 2) {
                $collection[$info[0]]['info'][$info[1]] = array($catalogItem[1], 'info' => array());;
            }

            if (count($info) == 3) {
                $collection[$info[0]]['info'][$info[1]]['info'][] = $catalogItem;
            }
        }

        return $collection;
    }

    private function _getQntDocumentsInCategory($id)
    {
        $oDb = oxDb::getDb();
        $sQ = "SELECT count(*) FROM zsdocuments WHERE oxid = " . $oDb->quote($id);

        return $oDb->getOne($sQ);
    }
}