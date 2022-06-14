<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");

    function AktiviratiKorisnickiRacun()
    {
        global $vrijemeZaAktivacijuUSatima;
        if(isset($_GET['aktivacijskiKod']))
        {
            $selectString = "SELECT * FROM Korisnik WHERE aktivacijskiKod = '".$_GET['aktivacijskiKod']."';";
            $selectUpit = ObavitiSelectUpit($selectString);
            if(mysqli_num_rows($selectUpit) == 1)
            {
                $datumvrijemeKreiranja = mysqli_fetch_assoc($selectUpit)['datumRegistracije'];
                //echo (strtotime($datumvrijemeKreiranja) + $vrijemeZaAktivacijuUSatima * 60 * 60).":".MojeVrijemeUnix()."<br";
                $aktiviratiString = "UPDATE Korisnik SET aktiviran = 1 WHERE aktivacijskiKod = '".$_GET['aktivacijskiKod']."'";
                if((strtotime($datumvrijemeKreiranja) + $vrijemeZaAktivacijuUSatima * 60 * 60) > MojeVrijemeUnix())
                {
                    if(ObavitiOstaleUpit($aktiviratiString))
                    {
                        echo "Uspješno ste aktivirali korisnicki racun!<br>";
                    }
                }
                else
                {
                    echo "Korisnicki racun nije aktiviran!<br>Vrijeme servera: ".MojDatumVrijeme(false)."<br>Rok aktivacije: ".date("Y-m-d H:i:s",strtotime($datumvrijemeKreiranja) + $vrijemeZaAktivacijuUSatima * 60 * 60);
                }
            }
            else
            {
                echo "Korisnicki racun nije naden!<br>";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Aktivacija</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">
    </head>

    <body>
        <header>

        </header>

        <nav>
            <a href="index.php">Početna stranica</a>
            <a href="vijesti.php">Vijesti</a>
            <?php GenerirnjeNavigacijskihGumba() ?>

            <a href="dokumentacija.html">Dokumentacija</a>
            <a href="o_autoru.html">O autoru</a>
        </nav>

        <section>
            <div><?php AktiviratiKorisnickiRacun() ?></div>
        </section>

        <footer>

        </footer>
    </body
</html>