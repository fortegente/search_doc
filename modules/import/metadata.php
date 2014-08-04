<?php
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'import',
    'title'        => 'Documents import',
    'version'      => '1.0.0',
    'author'       => 'Dmitry Martyniuk',
    'email'        => 'fortegente@gmail.com',
    'extend'       => array(),
      'files' => array(
          'import' => 'import/controllers/admin/import.php'
      ),
      'templates' => array(
          'import.tpl' => 'import/views/admin/tpl/import.tpl'
      ),
//
//    'blocks' => array(
//        array('template' => 'layout/page.tpl',             'block'=>'layout_page_vatinclude',               'file'=>'views/azure/blocks/theme_switch_link.tpl'),
//        array('template' => 'page/checkout/basket.tpl',    'block'=>'mb_basket_btn_next_top',               'file'=>'views/mobile/blocks/oepaypalexpresscheckout.tpl'),
//        array('template' => 'page/checkout/basket.tpl',    'block'=>'mb_basket_btn_next_bottom',            'file'=>'views/mobile/blocks/oepaypalexpresscheckout.tpl'),
//        array('template' => 'page/checkout/payment.tpl',   'block'=>'mb_select_payment',                    'file'=>'views/mobile/blocks/oepaypalpaymentselector.tpl'),
//    )
);