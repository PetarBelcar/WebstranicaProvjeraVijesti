<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/sesija.php");

    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");

    function BlokiratiKorisnika()
    {
        $selectStringModeratorPrava = "SELECT * FROM Korisnik k inner join ModeratorKategorije mk on k.id = mk.idModeratora where k.id = ".$_SESSION['korisnik']['id']." and mk.idKategorijeVijesti = ".$_GET['idKategorije'].";";
        //echo $selectStringModeratorPrava."<br>";
        $selectUpitModeratorPrava = ObavitiSelectUpit($selectStringModeratorPrava);
        if(mysqli_num_rows($selectUpitModeratorPrava) < 1)
        {
            echo "Korisnik nije moderator te kategorije!<br>";
        }
        else {
            if(isset($_POST['razlog']) && $_GET['azuriranje'] == 0)
            {
                //echo $_POST['datumvrijemeDoIstekaBlokiranja']."<br>";
                $datumvrijemeStringParametar = ($_POST['datumvrijemeDoIstekaBlokiranja'] != "") ? ", datumvrijemeDoIstekaBlokiranja" : "";
                $datumvrijemeStringUnos = ($_POST['datumvrijemeDoIstekaBlokiranja'] != "") ? ", '".$_POST['datumvrijemeDoIstekaBlokiranja']."'" : "";
                $razlogString = ($_POST['razlog'] != "") ? "'".$_POST['razlog']."'" : "null";
                $insertString = "INSERT INTO BlokiraniKorisnik(idBlokiranogKorisnika, idModeratora, idKategorijeVijesti, razlog".$datumvrijemeStringParametar.") VALUE(".$_GET['idKorisnika'].", ".$_SESSION['korisnik']['id'].", ".$_GET['idKategorije'].", ".$razlogString."".$datumvrijemeStringUnos.")";
                //echo $insertString."<br>";
                if(!ObavitiOstaleUpit($insertString))
                {
                    echo "Greška kod unosa blokiranja na bazu!<br>";
                }
                else 
                {
                    echo "Korisnik blokiran!<br>";
                }
            }

            if(isset($_POST['razlog']) && $_GET['azuriranje'] == 1)
            {
                //echo $_POST['datumvrijemeDoIstekaBlokiranja']."<br>";
                $datumvrijemeStringParametar = ($_POST['datumvrijemeDoIstekaBlokiranja'] != "") ? ", datumvrijemeDoIstekaBlokiranja = " : "";
                $datumvrijemeStringUnos = ($_POST['datumvrijemeDoIstekaBlokiranja'] != "") ? " '".$_POST['datumvrijemeDoIstekaBlokiranja']."'" : "";
                $razlogString = ($_POST['razlog'] != "") ? "'".$_POST['razlog']."'" : "null";
                $insertString = "UPDATE BlokiraniKorisnik SET razlog = '".$_POST['razlog']."'".$datumvrijemeStringParametar.$datumvrijemeStringUnos." where idBlokiranogKorisnika = ".$_GET['idKorisnika']." and idModeratora = ".$_SESSION['korisnik']['id']." and idKategorijeVijesti = ".$_GET['idKategorije'].";";
                //echo $insertString."<br>";
                if(!ObavitiOstaleUpit($insertString))
                {
                    echo "Greška kod izmjene podataka o blokiranju!<br>";
                }
                else 
                {
                    echo "Podatci o blokiranju su izmjenjeni!<br>";
                }
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Blokiranje korisnika</title>
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
            <h3>Blokirati korisnika</h3>
            <?php BlokiratiKorisnika(); ?>
            <form id="formaBlokrianjeKorisnika" method="POST" action="blokiratiKorisnika.php?idKorisnika=<?php echo $_GET['idKorisnika'];?>&idKategorije=<?php echo $_GET['idKategorije'];?>&azuriranje=<?php echo $_GET['azuriranje']?>">
                <label for="inputRazlog">Razlog</label>
                <textarea id="inputRazlog" name="razlog"><?php if(isset($_GET['razlog'])) {echo $_GET['razlog'];}?></textarea><br>
                <label for="inputDatumvrijeme">Datum i vrijeme do isteka blokiranja</label>
                <input type="datetime-local" id="inputDatumvrijeme" name="datumvrijemeDoIstekaBlokiranja" value="<?php if(isset($_GET['datumvrijeme'])) {echo $_GET['datumvrijeme'];}?>"><br>
                <input type="submit" value="Blokirati korisnika">
            </form>
        </section>

        <footer>

        </footer>
    </body>
</html>