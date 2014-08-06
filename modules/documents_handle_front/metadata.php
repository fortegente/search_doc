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
          'documents' => 'documents_handle_front/controllers/documents.php'
      ),
      'templates' => array(
          'documents.tpl' => 'documents_handle_front/views/tpl/documents.tpl',
      )
);