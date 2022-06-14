<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/sesija.php");

    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");

    function StvoritiSelekcijuKategorija()
    {
        $selectString = "SELECT * FROM KategorijeVijesti;";
        $selectUpit = ObavitiSelectUpit($selectString);
        echo "<select name=\"idKategorijeVijesti\" id=\"inputKategorija\">";
        while($red = mysqli_fetch_assoc($selectUpit))
        {
            echo "<option value=\"".$red['id']."\">".$red['naziv']."</option>\n";
        }
        echo "</select>";
    }

    function DodatiNovuVijest()
    {
        if(isset($_POST['naslov']) && isset($_POST['tekst']) && isset($_POST['slika']) && isset($_POST['urlIzvora']) && isset($_POST['idKategorijeVijesti']))
        {
            $selectStringBlokirani = "SELECT * FROM BlokiraniKorisnik WHERE idBlokiranogKorisnika = ".$_SESSION['korisnik']['id']." and idKategorijeVijesti = ".$_POST['idKategorijeVijesti']." and (datumvrijemeDoIstekaBlokiranja > '".MojDatumVrijeme(false)."' or datumvrijemeDoIstekaBlokiranja is null);";
            //echo $selectStringBlokirani."<br>";
            $selectUpitBlokirani = ObavitiSelectUpit($selectStringBlokirani);
            if(mysqli_num_rows($selectUpitBlokirani) == 0)
            {
                $insertIntoVijest = "INSERT INTO Vijest(naslov, tekst, datumvrijemeKreiranja, revizija, slika, urlIzvora, idKategorijeVijesti, idKreator, brojPregleda) VALUE('".$_POST['naslov']."', '".$_POST['tekst']."', '".MojDatumVrijeme(false)."', 1, '".$_POST['slika']."', '".$_POST['urlIzvora']."', ".$_POST['idKategorijeVijesti'].", ".$_SESSION['korisnik']['id'].", 0)";
                //echo $insertIntoVijest."<br>";
                if(!ObavitiOstaleUpit($insertIntoVijest))
                {
                    echo "Greška kod upisa vijesti u bazu!<br>";
                }
                else 
                {
                    $selectStringZaIDVIjesti = "SELECT * FROM Vijest where idKreator = ".$_SESSION['korisnik']['id']." order by datumvrijemeKreiranja desc limit 1";
                    //echo $selectStringZaIDVIjesti."<br>";
                    $selectUpitZaIDVIjesti = ObavitiSelectUpit($selectStringZaIDVIjesti);
                    $idVijesti = mysqli_fetch_assoc($selectUpitZaIDVIjesti)['id'];
                    $insertIntoRecenzijaString = "INSERT INTO Recenzija(idVjesti, idVrsteRecenzije, idAdministratora, idModeratora) VALUE(". $idVijesti .", 3, 1, 21);";
                    //echo $insertIntoRecenzijaString."<br>";
                    
                    if(!ObavitiOstaleUpit($insertIntoRecenzijaString))
                    {
                        echo "Greška kod unosa recenzije za vijest!<br>";
                    }
                    else {
                        echo "Vijest je uspješno upisana!<br>";
                    }
                }
            }
            else {
                echo "Korisnik je blokiran u ovoj kategoriji vijesti!<br>";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Dodavanje vijesti</title>
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
            <h3>Dodavanje nove vijesti</h3>
            <div><?php DodatiNovuVijest(); ?>
            <form id="formaDodavanjeVijesti" method="POST" action="dodavanjeNoveVijesti.php">
                <label for="inputNaslov">Naslov: </label>
                <input type="text" id="inputNaslov" name="naslov" required><br>

                <label for="inputTextarea">Tekst vijesti:</label>
                <textarea id="inputTextarea" name="tekst" required></textarea><br>

                <label for="inputSlika">Slika: </label>
                <input type="text" id="inputSlika" name="slika" required><br>

                <label for="inputIzvor">URL izvora: </label>
                <input type="text" id="inputIzvor" name="urlIzvora"><br>
                <label for="inputKategorija">Kategorija: </label>
                <?php StvoritiSelekcijuKategorija();?><br>

                <input type="submit" value="Predati vijest">
            </form>
        </section>

        <footer>

        </footer>
    </body>
</html>