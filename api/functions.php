<?php
/*
* Site Wide Utility Functions
*/


/**
* Password Encrption Used
*/
function encrypt($password) {
return crypt(trim($password),CRYPT_SALT_LENGTH);
}


/**
*  Seralize and Unseralize Array for DataStorage
*/
function seralizeOptions($arr) {
return base64_encode(serialize($arr));
}

function unseralizeOptions($arr) {
return unserialize(base64_decode($arr));
}


?>
