<?php
class zsCataloglist extends oxList
{
    public function __construct( $sObjectsInListName = 'zscatalog')
    {
        parent::__construct( 'zscatalog');
    }

    public function getCatalogList()
    {
        return $this->getList();
    }
}