<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit2d0362929eb2bc3efde57e48a2c4e34b
{
    public static $files = array (
        '233b55e313fa5c796626b872a37ba5d1' => __DIR__ . '/..' . '/law909/altorouter/AltoRouter.php',
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit2d0362929eb2bc3efde57e48a2c4e34b::$classMap;

        }, null, ClassLoader::class);
    }
}