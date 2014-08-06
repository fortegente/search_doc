<?php
$txt_file    = file_get_contents('test.txt');
$rows        = explode("\n", $txt_file);

foreach ($rows as $row => $data) {
    $a = explode(" ", $data);
    $info[$row] = trim($data);
}

$a = $info;
