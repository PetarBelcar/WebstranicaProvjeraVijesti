<?php
    session_start();
    require_once('virtualnoVrijeme.php');

    $konfiguracijaJSON = file_get_contents("JavaScript/konfiguracija.json");
    $jsonData = json_decode($konfiguracijaJSON, true);

    $trajanjeCookiea = $jsonData['trajanjeUvjetaUDanima'] * 24 * 60 * 60;

    if(isset($_SESSION['korisnik']))
    {
        $korisnickoImeKorisnika = $_SESSION['korisnik']['korisnickoIme'];
        $idKorisnika = $_SESSION['korisnik']['id'];
        $kategorijaKorisnika = $_SESSION['korisnik']['KategorijaKorisnika_id'];
        if($_SESSION['korisnik']['uvjetiKoristenja'] == 0)
        {
            setcookie('phihvaćanjeUvjeta', "false", MojeVrijemeUnix() + $trajanjeCookiea);
        }
        else 
        {
            setcookie('phihvaćanjeUvjeta', "true", MojeVrijemeUnix() + $trajanjeCookiea);
        }
    }
?>