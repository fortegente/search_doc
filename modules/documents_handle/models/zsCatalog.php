<?php
class zsCatalog extends oxBase
{
    protected $_sClassName = 'zscatalog';

    public function __construct()
    {
        parent::__construct();
        $this->init( 'zscatalog' );
    }
}