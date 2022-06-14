<?php
    require_once("radSaBazom.php");

    function ProvjeritiJeLiKorisnickoImeZauzeto($korisnickoIme)
    {
        $brojString = "SELECT * FROM Korisnik where korisnickoIme = '". $korisnickoIme . "';";
        //echo $brojString;
        if(VratiBrojRedovaUZahtjevu($brojString) > 0)
        {
            echo 1;
            exit;
        }
        else {
            echo 0;
            exit;
        }
    }

    function ProvjeritiJeLiEmailZauzet($email)
    {
        $brojString = "SELECT * FROM Korisnik where email = '". $email . "';";
        //echo $brojString;
        if(VratiBrojRedovaUZahtjevu($brojString) > 0)
        {
            echo 1;
            exit;
        }
        else {
            echo 0;
            exit;
        }
    }

    function ProvjeritiJeLiKorisnickoImeZauzetoPHP($korisnickoIme)
    {
        $brojString = "SELECT * FROM Korisnik where korisnickoIme = \"". $korisnickoIme . "\";";
        //echo $brojString;
        if(VratiBrojRedovaUZahtjevu($brojString) > 0)
        {
            return true;
        }
        else {
            return false;
        }
    }

    function ProvjeritiJeLiEmailZauzetPHP($email)
    {
        $brojString = "SELECT * FROM Korisnik where email = \"". $email . "\";";
        //echo $brojString;
        if(VratiBrojRedovaUZahtjevu($brojString) > 0)
        {
            return true;
        }
        else {
            return false;
        }
    }

    function ProvjeraJeLiKorisnickiRacunZakljucanPHP($idKorisnickogRacuna)
    {
        $selectString = "SELECT * FROM ZakljucaniKorisnik WHERE idKorisnika = '".$idKorisnickogRacuna."';";
        if(mysqli_num_rows(ObavitiSelectUpit($selectString)) > 0)
        {
            return true;
        }
        else 
        {
            return false;
        }
    }

    if(isset($_GET['korisnickoIme']))
    {
        echo ProvjeritiJeLiKorisnickoImeZauzeto($_GET['korisnickoIme']);
        exit;
    }

    if(isset($_GET['email']))
    {
        echo ProvjeritiJeLiEmailZauzet($_GET['email']);
        exit;
    }
?>