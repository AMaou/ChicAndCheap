<?php

// Register global error and exception handlers
use Symfony\Component\Debug\ErrorHandler;
ErrorHandler::register();
use Symfony\Component\Debug\ExceptionHandler;
ExceptionHandler::register();


// ...

// Register service providers.
$app->register(new Silex\Provider\DoctrineServiceProvider());
$app->register(new Silex\Provider\FormServiceProvider());
$app->register(new Silex\Provider\TranslationServiceProvider());
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    'twig.path' => __DIR__.'/../views',
));
$app->register(new Silex\Provider\UrlGeneratorServiceProvider());
$app->register(new Silex\Provider\SessionServiceProvider());
$app->register(new Silex\Provider\SecurityServiceProvider(), array(
    'security.firewalls' => array(
        'secured' => array(
            'pattern' => '^/',
            'anonymous' => true,
            'logout' => true,
            'form' => array('login_path' => '/login', 'check_path' => '/login_check'),
            'users' => $app->share(function () use ($app) {
                return new ChicAndCheap\DAO\VisiteurDAO($app['db']);
            }),
        ),
    ),
));

// Register services.
$app['dao.article_femme'] = $app->share(function ($app) {
    return new ChicAndCheap\DAO\Article_femmeDAO($app['db']);
});

$app['dao.article_enfant'] = $app->share(function ($app) {
    return new ChicAndCheap\DAO\Article_enfantDAO($app['db']);
});

$app['dao.article_homme'] = $app->share(function ($app) {
    return new ChicAndCheap\DAO\Article_hommeDAO($app['db']);
});

$app['dao.typearticle'] = $app->share(function ($app) {
    return new ChicAndCheap\DAO\TypearticleDAO($app['db']);
});

$app['dao.couleurarticle'] = $app->share(function ($app) {
    return new ChicAndCheap\DAO\CouleurarticleDAO($app['db']);
});

$app['dao.article'] = $app->share(function ($app) {
    $articleDAO = new ChicAndCheap\DAO\articleDAO($app['db']);
    $articleDAO->setTypearticleDAO($app['dao.typearticle']);
    $articleDAO->setCouleurarticleDAO($app['dao.couleurarticle']);
    return $articleDAO;
});