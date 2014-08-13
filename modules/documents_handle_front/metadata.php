<?php
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'documents_handle_front',
    'title'        => 'Work with collection of documents on frontend',
    'version'      => '1.0.0',
    'author'       => 'Dmitry Martyniuk',
    'email'        => 'fortegente@gmail.com',
    'extend'       => array(),
      'files' => array(
          'documents' => 'documents_handle_front/controllers/documents.php',
          'catalog' => 'documents_handle_front/controllers/catalog.php'
      ),
      'templates' => array(
          'catalog.tpl' => 'documents_handle_front/views/tpl/catalog.tpl',
      )
);