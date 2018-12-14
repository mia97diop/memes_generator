<?php

// require 'model/model.php';

// if(isset($_POST['image'])) {
//     $save = str_replace('data:image/png;base64,', '', $_POST['image'] );
//     file_put_contents( 'img/image.png', base64_decode( $save ) );
// }

function destroy_session() {
    if(isset($_SESSION['user'])) {
        session_destroy();
    }
}