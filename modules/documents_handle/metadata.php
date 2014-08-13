<?php
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'documents_handle',
    'title'        => 'Work with collection of documents',
    'version'      => '1.0.0',
    'author'       => 'Dmitry Martyniuk',
    'email'        => 'fortegente@gmail.com',
    'extend'       => array(
        'oxemail' => 'documents_handle/core/zsemail',
    ),
      'files' => array(
          'Admin_Zsdocuments' => 'documents_handle/controllers/admin/admin_zsdocuments.php',
          'Documents_List'    => 'documents_handle/controllers/admin/documents_list.php',
          'Documents_Main'    => 'documents_handle/controllers/admin/documents_main.php',
          'zsDocuments'       => 'documents_handle/models/zsDocuments.php',
          'zsDocumentslist'   => 'documents_handle/models/zsDocumentslist.php',
          'zsUser2Documents'  => 'documents_handle/models/zsUser2Documents.php',
          'zsCataloglist'   => 'documents_handle/models/zsCataloglist.php',
          'zsCatalog'   => 'documents_handle/models/zsCatalog.php',
      ),
      'templates' => array(
          'admin_documents.tpl' => 'documents_handle/views/admin/tpl/admin_documents.tpl',
          'documents_list.tpl'  => 'documents_handle/views/admin/tpl/documents_list.tpl',
          'documents_main.tpl'  => 'documents_handle/views/admin/tpl/documents_main.tpl'
      )
);