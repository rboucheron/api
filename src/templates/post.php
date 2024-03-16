<?php

switch ($table) {

    default:
        include('./src/httpcode/400.php');
}

function Post($controller, $datas)
{
    $controller->post($datas);
}
