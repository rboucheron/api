<?php

switch ($table) {

           
    default:
        include('./src/httpcode/400.php');
}

function Put($controller, $datas)
{
    if (isset($_GET['id']) && ($_GET['id'] != '')) {
        $controller->update($_GET['id'], $datas);
    } else {
        include('./src/httpcode/404.php');
    }
}
