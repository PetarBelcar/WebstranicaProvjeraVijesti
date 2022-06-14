<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/sesija.php");

    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");

    function DeblokiranjeKorisnika()
    {
        if(isset($_GET['idKorisnika']) && isset($_GET['idKategorije']))
        {
            $selectStringKorisnik = "SELECT * FROM Korisnik WHERE id = ".$_GET['idKorisnika'].";";
            $selectUpitKorisnik = ObavitiSelectUpit($selectStringKorisnik);
            if(!$selectUpitKorisnik)
            {
                echo "Greška kod dohvaćanja korisnika s baze!<br>";
                return;
            }
            else
            {
                $korisnik = mysqli_fetch_assoc($selectUpitKorisnik);
            }

            $selectStringKategorije = "SELECT * FROM KategorijeVijesti where id = ".$_GET['idKategorije'].";";
            $selectUpitKategorija = ObavitiSelectUpit($selectStringKategorije);
            if(!$selectUpitKategorija)
            {
                echo "Greška kod dohvaćanja kategorije s baze!<br>";
                return;
            }
            else
            {
                $kategorija = mysqli_fetch_assoc($selectUpitKategorija);
            }

            $deleteString = "DELETE FROM BlokiraniKorisnik WHERE idBlokiranogKorisnika = ".$korisnik['id']." and idKategorijeVijesti = ".$kategorija['id']." and idModeratora = ".$_SESSION['korisnik']['id'].";";
            if(!ObavitiOstaleUpit($deleteString))
            {
                echo "Greška kod brizanja zapisa sa baze podataka!<br>";
            }
            else
            {
                echo $korisnik['korisnickoIme']." je deblokiran iz kategorije ".$kategorija['naziv']."!<br>";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Deblokiranje korisnika</title>
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
            <h3>Deblokiranje korisnika</h3>
            <?php DeblokiranjeKorisnika();?>
        </section>

        <footer>

        </footer>
    </body>
</html>