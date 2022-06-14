<?php
    require_once('PHPFunkcijskiPaketi/radSaBazom.php');
    require_once('PHPFunkcijskiPaketi/sesija.php');
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");

    if(isset($_GET['idVijesti']))
    {
        $idVijesti = $_GET['idVijesti'];
    }
    else 
    {
        $idVijesti = 1;
    }

    $vijestRedovi = ObavitiSelectUpit("SELECT * FROM Vijest WHERE id=".$idVijesti.";");
    $vijest = mysqli_fetch_assoc($vijestRedovi);

    function GeneriratiSelekcijuStanjaRecenzije()
    {
        $selectString = "SELECT * FROM StanjeRecenzije;";
        $selectUpit = ObavitiSelectUpit($selectString);
        if(!$selectUpit)
        {
            echo "Greška kod dohvaćanja stanja recenzija s baze podataka!<br>";
        }
        else 
        {
            echo "<label for=\"inputStanje\">Stanje recenzije: </label>\n<select id=\"inputStanje\" name=\"idVrsteRecenzije\">\n";
            while($stanje = mysqli_fetch_assoc($selectUpit))
            {
                echo "<option value=\"".$stanje['id']."\">". $stanje['nazivSTanja']."</option>\n";
            }
            echo "</select><br>\n";
        }
    }

    function GenerirajSelekcijuVrstuGreške()
    {
        $selectString = "SELECT * FROM VrstaGreške;";
        $selectUpit = ObavitiSelectUpit($selectString);
        if(!$selectUpit)
        {
            echo "Greška kod dohvaćanja vrsta greške s baze podataka!<br>";
        }
        else 
        {
            echo "<label for=\"inputVrsteGreske\">Vrste greške: </label>\n<select id=\"inputVrsteGreske\" name=\"VrstaGreške_id\">\n";
            while($stanje = mysqli_fetch_assoc($selectUpit))
            {
                echo "<option value=\"".$stanje['id']."\">". $stanje['nazivGreške']."</option>\n";
            }
            echo "</select><br>\n";
        }
    }

    function VratiIdRecenzije()
    {
        global $idVijesti;
        $selectString = "SELECT r.id FROM Recenzija r INNER JOIN Vijest v ON v.id = r.idVjesti where v.id = ". $idVijesti."";
        $selectUpit = ObavitiSelectUpit($selectString);
        if(!$selectUpit)
        {
            echo "Greška kod dohvaćanja ID recenzije!<br>";
            return null;
        }
        else 
        {
            return mysqli_fetch_assoc($selectUpit)['id'];
        }
    }

    function UpisatiGrešku()
    {
        if(isset($_POST['opis']) && isset($_POST['pocetakGreske']) && isset($_POST['krajGreske']) && isset($_POST['VrstaGreške_id']))
        {
            $_POST['pocetakGreske'] = ($_POST['pocetakGreske'] == "") ? "null" : $_POST['pocetakGreske'];
            $_POST['krajGreske'] = ($_POST['krajGreske'] == "") ? "null" : $_POST['krajGreske'];
            $insertString = "INSERT INTO Pogreske(idRecenzije, pocetakGreske, krajGreske, opis, VrstaGreške_id) VALUE(".VratiIdRecenzije().", ".$_POST['pocetakGreske'].", ".$_POST['krajGreske'].", '".$_POST['opis']."', ".$_POST['VrstaGreške_id'].")";
            if(!ObavitiOstaleUpit($insertString))
            {
                echo $insertString."<br>";
                echo "Greška kod unošenja greške u bazu!<br>";
            }
            else 
            {
                echo "Greška unesena u bazu!<br>";
            }
        }
    }

    function UpdatatiRecenziju()
    {
        if(isset($_POST['tag']) && isset($_POST['komentar']) && isset($_POST['idVrsteRecenzije']))
        {
            $_POST['komentar'] = ($_POST['komentar'] == "") ? null : $_POST['komentar'];
            $insertString = "UPDATE Recenzija SET idVrsteRecenzije = ".$_POST['idVrsteRecenzije'].", komentar = '".$_POST['komentar']."', tag = '".$_POST['tag']."' where id = ".VratiIdRecenzije().";";
            //echo $insertString."<br>";
            if(!ObavitiOstaleUpit($insertString))
            {
                echo "Došlo je do greške kod izmjene podataka recenzije!<br>";
            }
            else {
                echo "Recenzija uspješno izmjenjena!<br>";
                header("Location: https://". $_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/recenzije.php");
            }
        }
    }

    $selectStringRecenzija = "SELECT * FROM Recenzija where id = ".VratiIdRecenzije().";";
    $selectUputRecenzija = ObavitiSelectUpit($selectStringRecenzija);
    if(!$selectUputRecenzija)
    {
        echo "Recenzija ne postoji!<br>";
    }
    else 
    {
        if(mysqli_fetch_assoc($selectUputRecenzija)['idVrsteRecenzije'] != 3)
        {
            header("Location: https://". $_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008");
        }
    }
?>

<html lang="hr">
    <head>
        <title id="titleVijesti"><?php echo $vijest['naslov'] ?></title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">

        <link rel="stylesheet" href="CSS/vijest.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JavaScript/recenzija.js"></script>
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
            <h3>Vijest</h3>
            <h3 id="naslovVijesti"><?php echo $vijest['naslov'] ?></h3>
            <div id="slikaVijesti"><img src="<?php echo $vijest['slika'] ?>"></div>
            <div id="textVijesti"><?php echo $vijest['tekst'] ?></div>
            <div id="izvorVijesti"><a href="<?php echo $vijest['urlIzvora'] ?>"><?php echo $vijest['urlIzvora'] ?></a></div>

            <h3>Greške</h3>
            <form id="formGreška" method="POST" action="recenzija.php?idVijesti=<?php echo $idVijesti?>">
                <?php UpisatiGrešku();?>
                <input type="hidden" id="idVjest" value="<?php echo $idVijesti;?>">
                <label for="inputOpis">Opis: </label>
                <textarea id="inputOpis" name="opis">Opis</textarea><br>
                <label for="inputPocetakGreske">Pocetak pogreske: </label>
                <input type="text" id="inputPocetakGreske" name="pocetakGreske" value=""><br>
                <label for="inputKrajGreske">Kraj pogreške: </label>
                <input type="text" id="inputKrajGreske" name="krajGreske" value=""><br>
                <?php GenerirajSelekcijuVrstuGreške();?>

                <input type="submit" value="Predaj grešku">
            </form>

            <div id="tablicaGreška">
                <button id="prosliButton">Prosla</button>
                <button id="sljedeciButton">Sljedeca</button>
                <div id="brojStranice"></div>
                
                <div id="galerijaPogreška">Tablica test</div>
            </div>

            <h3>Recenzija</h3>
            <?php UpdatatiRecenziju();?>
            <form id="formaRecenzija" method="POST" action="recenzija.php?idVijesti=<?php echo $idVijesti?>">
                <label for="inputTag">Tagovi: </label>
                <input type="text" id="inputTag" name="tag" require><br>
                <?php GeneriratiSelekcijuStanjaRecenzije()?>
                <label for="inputKomentar">Komentar: </label>
                <textarea id="inputKomentar" name="komentar"></textarea><br>

                <input type="submit" value="Predati recenziju">
            </form>
        </section>

        <footer>

        </footer>
    </body>
</html>