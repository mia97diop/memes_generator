<?php
session_start();

require_once 'controller/controller.php';
require_once 'controller/user_controller.php';

//twig config
$loader = new Twig_Loader_Filesystem('view');
$twig = new Twig_Environment($loader, [
    'cache' => false,
]);

$link = basename($_SERVER['REQUEST_URI']);

if($link == 'meme_creator') {
    $link = '/';
}

if($link == '/' || $link == 'accueil') {
    if(isset($_SESSION['user']) && isset($_SESSION['email'])) {
        echo $twig->render('accueil.twig', ['user' => $_SESSION['user'], 'email' => $_SESSION['email']]);
    }
    else {
        echo $twig->render('accueil.twig', ['title' => $link]);
    }
}

else if($link == 'login') {
    echo $twig->render('login.twig', ['title' => $link]);
}

else if($link == 'deconnexion') {
    echo $twig->render('accueil.twig', ['title' => $link, 'logout' => destroy_session()]);
}

else if($link == 'signup') {
    echo $twig->render('signup.twig', ['title' => $link]);
}

else if($link == 'admin') {
    echo $twig->render('admin/admin.twig', ['title' => $link]);
}

else if($link == 'a-propos') {
    if(isset($_SESSION['user']) && isset($_SESSION['email'])) {
        echo $twig->render('about.twig', ['title' => $link, 'user' => $_SESSION['user'], 'email' => $_SESSION['email']]);
    }
    else {
        echo $twig->render('about.twig', ['title' => $link]);
    }
}

else {
    echo $twig->render('error.twig', ['title' => $link]);
}
