<?php
class zsCataloglist extends oxList
{
    public function __construct( $sObjectsInListName = 'zscatalog')
    {
        parent::__construct( 'zscatalog');
    }

    public function getCatalogList($group = null, $subgroup = null, $documents = null)
    {
        $collection = array();
        $listCollection = $this->getList();

        foreach ($listCollection as $catalogItem) {
            if (!$group) {
                if (substr_count($catalogItem->zscatalog__oxid, ".") == 0) {
                    $countSubcategories = $this->_countSubCategories();
                    $catalogItem->zscatalog__count_sub_cat= new oxField($group);
                    $collection[] = $catalogItem;
                }
            } elseif ($group && $subgroup) {
                $info = explode('.', $catalogItem->zscatalog__oxid);
                if (count($info) == 3 && $info[0] == $group && $info[1] == $subgroup) {
                    $collection[] = $catalogItem;
                }
            } elseif ($group) {
                $info = explode('.', $catalogItem->zscatalog__oxid);
                if (count($info) == 2 && $info[0] == $group) {
                    $collection[] = $catalogItem;
                }
            }
        }

        return $collection;
    }

    private function _countSubCategories()
    {

    }
}