<?php
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

// Excelファイルのパス
$excelFile = 'hello_world.xlsx';

// Excelファイルの読み込み
$spreadsheet = IOFactory::load($excelFile);

// シートを取得
$sheet = $spreadsheet->getActiveSheet();

// セルA1の値を取得
$cellValue = $sheet->getCell('A1')->getValue();

// 画面に表示
echo "A1の値は: " . $cellValue;

