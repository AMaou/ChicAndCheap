<?php

use Symfony\Component\HttpFoundation\Request;
use ChicAndCheap\Domain\Categorie;

// Page d'accueil
$app->get('/', function () use ($app) {
    return $app['twig']->render('index.html.twig');
})->bind('home');

// Liste de tous les articles femmes
$app->get('/article_femme/', function() use ($app) {
    $articles_femmes = $app['dao.article_femme']->findAll();
    return $app['twig']->render('articles_femmes.html.twig', array('articles_femmes' => $articles_femmes));
})->bind('articles_femmes');

// Détails sur article 

$app->get('/article/{code}', function($code) use ($app) {
    $article = $app['dao.article']->find($code);
    return $app['twig']->render('articles_details.html.twig', array('article' => $article));
})->bind('article');

// Liste de tous les articles hommes
$app->get('/article_homme/', function() use ($app) {
    $articles_hommes = $app['dao.article_homme']->findAll();
    return $app['twig']->render('articles_hommes.html.twig', array('articles_hommes' => $articles_hommes));
})->bind('articles_hommes');

// Liste de tous les articles enfants
$app->get('/article_enfant/', function() use ($app) {
    $articles_enfants = $app['dao.article_enfant']->findAll();
    return $app['twig']->render('articles_enfants.html.twig', array('articles_enfants' => $articles_enfants));
})->bind('articles_enfants');

// Liste de tous les articles
$app->get('/article/', function() use ($app) {
    $articles = $app['dao.article']->findAll();
    return $app['twig']->render('articles.html.twig', array('articles' => $articles));
})->bind('articles');

// Login form
$app->get('/login', function(Request $request) use ($app) {
    return $app['twig']->render('login.html.twig', array(
        'error'         => $app['security.last_error']($request),
        'last_username' => $app['session']->get('_security.last_username'),
    ));
})->bind('login');
