<?php
    require_once('PHPFunkcijskiPaketi/virtualnoVrijeme.php');
    require_once('PHPFunkcijskiPaketi/radSaBazom.php');
    require_once('PHPFunkcijskiPaketi/sesija.php');

    $konfiguracijaJSON = file_get_contents("JavaScript/konfiguracija.json");
    $jsonData = json_decode($konfiguracijaJSON, true);

    $trajanjeCookiea = $jsonData['trajanjeUvjetaUDanima'] * 24 * 60 * 60;

    function ispisStanjaPrihvaćanja()
    {
        global $trajanjeCookiea;
        if(isset($_SESSION['korisnik']))
        {
            echo "Postavljanje za ulogiranog korisnika!<br>";
            if(isset($_GET['stanje']))
            {
                if($_GET['stanje'] === "true")
                {
                    $updateString = "UPDATE Korisnik SET uvjetiKoristenja = 1 where id = ".$_SESSION['korisnik']['id'].";";
                    //echo $updateString."<br>";
                    if(!ObavitiOstaleUpit($updateString))
                    {
                        echo "Greška kod izmjene podataka o prihvaćanju uvjeta korištenja!<br>";
                    }
                    $_SESSION['korisnik']['uvjetiKoristenja'] = "1";
                    header("Location: http://".$_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/index.php");
                }
                else 
                {
                    $updateString = "UPDATE Korisnik SET uvjetiKoristenja = 0 where id = ".$_SESSION['korisnik']['id'].";";
                    //echo $updateString."<br>";
                    if(!ObavitiOstaleUpit($updateString))
                    {
                        echo "Greška kod izmjene podataka o prihvaćanju uvjeta korištenja!<br>";
                    }
                    $_SESSION['korisnik']['uvjetiKoristenja'] = "0";
                }
            }
        }
        else if(isset($_GET['stanje']))
        {
            if($_GET['stanje'] === "true")
            {
                echo "Uvijeti su prihvaćeni!<br>";
                setcookie('phihvaćanjeUvjeta', "true", MojeVrijemeUnix() + $trajanjeCookiea);
            }
            else 
            {
                setcookie('phihvaćanjeUvjeta', "false", MojeVrijemeUnix() + $trajanjeCookiea);
                echo "Uvijeti nisu prihvaćeni!<br>"; 
            }
        }
        else 
        {
            echo "Uvijeti nisu prihvaćeni!<br>"; 
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Uvjeti korištenja</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">
        <link rel="stylesheet" href="">
    </head>

    <body>
        <header>

        </header>

        <nav>
            <a href="index.php">Početna stranica</a>

            <a href="dokumentacija.html">Dokumentacija</a>
            <a href="o_autoru.html">O autoru</a>
        </nav>

        <section>
            <h3>Uvjeti korištenja</h3>
            <div id="divUvjetiText">Text uvjeta korištenja</div>
            <form id="formUvjetiKoristenja" type="GET" action="uvjetiKoristenja.php">
                <select name="stanje">
                    <option value="true">Prihvaćam</option>
                    <option value="false">Odbijam</option>
                </select>
                <input type="submit" value="Submit">
            </form>

            <div id="stanjeUvjetaPrihvaćanja"><?php ispisStanjaPrihvaćanja() ?></div>
        </section>

        <footer>

        </footer>
    </body>
</html>