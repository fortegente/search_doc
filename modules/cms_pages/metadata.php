<?php
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'cms_pages',
    'title'        => 'Module to handle info pages',
    'version'      => '1.0.0',
    'author'       => 'Dmitry Martyniuk',
    'email'        => 'fortegente@gmail.com',
    'extend'       => array(),
    'files' => array(
        'zsexpert'       => 'cms_pages/controllers/zsexpert.php',
        'zsprofessional' => 'cms_pages/controllers/zsprofessional.php',
        'registerinfo'   => 'cms_pages/controllers/registerinfo.php'
    ),
    'templates' => array(
        'expert.tpl'         => 'cms_pages/views/tpl/expert.tpl',
        'zsprofessional.tpl' => 'cms_pages/views/tpl/zsprofessional.tpl',
        'register-info.tpl'  => 'cms_pages/views/tpl/register-info.tpl'
    )
);