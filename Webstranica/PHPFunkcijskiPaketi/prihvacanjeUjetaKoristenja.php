<?php
    require_once('sesija.php');
    if(isset($_SESSION['korisnik']))
    {
        if($_SESSION['korisnik']['uvjetiKoristenja'] != 1)
        {
            header("Location: http://".$_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/uvjetiKoristenja.php");
        }
    }
    else if(!isset($_COOKIE['phihvaćanjeUvjeta']))
    {
        header("Location: http://".$_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/uvjetiKoristenja.php");
    }
    else if($_COOKIE['phihvaćanjeUvjeta'] === "false")
    {
        header("Location: http://".$_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/uvjetiKoristenja.php");
    }
?>