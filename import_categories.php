<?php
require_once dirname(__FILE__) . "/bootstrap.php";

$resultArray = parseFile('test.txt');
Oxid::run();

if (count($resultArray)) {
    insertDataToDb($resultArray);
}

function insertDataToDb($data)
{
    $oDb = oxDb::getDb();
    $count = 0;

    foreach ($data as $key => $value) {
        $sQ = "insert into zsdocuments_nomenclature (oxid, title) VALUES (" . $oDb->quote($key) . ", " . $oDb->quote($value) . ")";
        $oDb->execute($sQ);
        $count++;
    }

    echo "insert $count items";
}


function parseFile($filename)
{
    $fileContent = file_get_contents($filename);
    $rows = explode("\n", $fileContent);

    foreach ($rows as $data) {
        if (!$data) {
            continue;
        }

        $arrayWithData = mb_split("\s",trim($data),2);
        $index = rtrim(rtrim($arrayWithData[0]), ".");
        $result[$index] = mb_convert_case($arrayWithData[1], MB_CASE_LOWER, 'UTF-8');
    }

    return $result;
}