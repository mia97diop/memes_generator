<?php


require_once 'model/model.php';


/**
 * sign up
 */

if(isset($_POST['addUserBtn'])) {

    $pseudo = htmlspecialchars($_POST['inputPseudo']);
    $user_email = htmlspecialchars($_POST['inputEmail']);
    $password = htmlspecialchars($_POST['inputPassword']);
    $confirm = htmlspecialchars($_POST['confirmPassword']);


    if($password != $confirm) {
        header('Location: signup');
    }
    else {
        $hash_pass = password_hash($password, PASSWORD_DEFAULT);

        add_user_account($pseudo, $user_email, $hash_pass);
        
        header('Location: login');
    }
}


/**
 * login
 */
if(isset($_POST['loginBtn'])) {
    $input_log = htmlspecialchars($_POST['inputLogin']);
    $input_pass = htmlspecialchars($_POST['inputPassword']);

    $user_exist = verify_user_exist($input_log);

    if($user_exist['exist']) {
        $verify_pass = false;
        while($result = $user_exist['request']->fetch()) {
            $verify_pass = password_verify($input_pass, $result['user_password']);
            $user_pseudo = $result['pseudo'];
            $email = $result['user_email'];
        }
        if($verify_pass) {
            session_start();
            $_SESSION['user'] = $user_pseudo;
            $_SESSION['email'] = $email;

            header('Location: accueil');
        }
        else {
            echo('<script> alert("Mot de passe incorrect"); </script>');
        }
    }
    else {
        echo('<script> alert("Vous n\'avez encore de compte\n Veillez vous inscrire"); </script>');
    }
}

