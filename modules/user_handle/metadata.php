<?php
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'user_handle',
    'title'        => 'Work with users',
    'version'      => '1.0.0',
    'author'       => 'Dmitry Martyniuk',
    'email'        => 'fortegente@gmail.com',
    'extend'       => array(
        'user_main'           => 'user_handle/controllers/admin/zsuser_main'
    ),
    'files' => array(
        'zsaccount_documents' => 'user_handle/controllers/zsaccount_documents.php'
    ),
    'templates' => array(
        'account_documents.tpl' => 'user_handle/views/tpl/account_documents.tpl',
    ),
    'blocks' => array(
        array('template' => 'user_main.tpl', 'block'=>'admin_user_main_form', 'file'=>'/out/blocks/admin_user_main_form_ext.tpl'),
    )
);