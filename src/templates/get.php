<?php

switch ($table) {


    default:
        include('./src/httpcode/400.php');
}

function Get($controller)
{
    if (isset($_GET['id']) && ($_GET['id'] != '')) {
        $response =  $controller->get($_GET['id']);
    } else {
        $response = $controller->getAll();
    }
    if (json_decode($response, true)  == []) {
        include('./src/httpcode/404.php');
    } else {
        echo $response;
    }
}
