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
        $selectionObjekt = "<select name=\"idKategorijeVijesti\" id=\"inputKategorija\">";
        while($red = mysqli_fetch_assoc($selectUpit))
        {
            $selectionObjekt .= "<option value=\"".$red['id']."\">".$red['naziv']."</option>\n";
        }
        $selectionObjekt .= "</select>";
        return $selectionObjekt;
    }

    function PostavljanjeVrijednostiVijesti()
    {
        $naslov = "";
        $tekst = "";
        $slika = "";
        $urlIzvora = "";

        if(isset($_GET['idVijesti']))
        {
            $idVijesti = $_GET['idVijesti'];
            $selectStringVijesti = "SELECT * FROM Vijest WHERE id = ".$_GET['idVijesti'].";";
            //echo $selectStringVijesti."<br>";
            $selectUpitVIjest = ObavitiSelectUpit($selectStringVijesti);
            if(!$selectUpitVIjest)
            {
                echo "Greška kod dohvaćanja vijesti!<br>";
            }
            else 
            {
                $vijest = mysqli_fetch_assoc($selectUpitVIjest);
                $naslov = $vijest['naslov'];
                $tekst = $vijest['tekst'];
                $slika = $vijest['slika'];
                $urlIzvora = $vijest['urlIzvora'];

                echo "<form id=\"formaIzmjenaVijesti\" method=\"POST\" action=\"izmjenaVijesti.php\">
                <label for=\"inputNaslov\">Naslov: </label>
                <input type=\"text\" id=\"inputNaslov\" name=\"naslov\" value=\"".$naslov."\" required><br>

                <label for=\"inputTextarea\">Tekst vijesti:</label>
                <textarea id=\"inputTextarea\" name=\"tekst\" required>".$tekst."</textarea><br>

                <label for=\"inputSlika\">Slika: </label>
                <input type=\"text\" id=\"inputSlika\" name=\"slika\" value=\"".$slika."\" required><br>

                <label for=\"inputIzvor\">URL izvora: </label>
                <input type=\"text\" id=\"inputIzvor\" name=\"urlIzvora\" value=\"".$urlIzvora."\" required><br>
                <label for=\"inputKategorija\">Kategorija: </label>
                ".StvoritiSelekcijuKategorija()."<br>
                <input type=\"hidden\" name=\"idVijesti\" value=\"".$idVijesti."\">
                <input type=\"submit\" value=\"Predati vijest\">
                <input type=\"hidden\" id=\"idVjest\" value=\"".$_GET['idVijesti']."\">
            </form>";
            }
        }
    }

    function IzmjenaPostojeceVijesti()
    {
        $selectStringVijesti = "SELECT * FROM Vijest WHERE id = ".$_POST['idVijesti'].";";
        //echo $selectStringVijesti."<br>";
        $selectUpitVIjest = ObavitiSelectUpit($selectStringVijesti);
        
        if(!$selectUpitVIjest)
        {
            echo "Greška kod dohvaćanja vijesti<br>";
        }
        else 
        {
            if(isset($_POST['naslov']) && isset($_POST['tekst']) && isset($_POST['slika']) && isset($_POST['urlIzvora']) && isset($_POST['idKategorijeVijesti']))
            {
                $vijest = mysqli_fetch_assoc($selectUpitVIjest);
                $selectStringRecenzija = "SELECT * FROM Recenzija where idVjesti = ".$vijest['id'].";";
                $selectUpitRecenzija = ObavitiSelectUpit($selectStringRecenzija);
                //echo $selectStringRecenzija."<br>";
                $recenzija = mysqli_fetch_assoc($selectUpitRecenzija);
                //echo $recenzija['idVrsteRecenzije']."<br>";
                if($recenzija['idVrsteRecenzije'] == 4)
                {
                    $revizija = $vijest['revizija'] + 1;
                    $idVijesti = $vijest['id'];
                    $updateString = "UPDATE Vijest SET naslov = '".$_POST['naslov']."', tekst = '".$_POST['tekst']."', slika = '".$_POST['slika']."', urlIzvora = '".$_POST['urlIzvora']."', idKategorijeVijesti = '".$_POST['idKategorijeVijesti']."', revizija = ". $revizija." where id = ".$idVijesti."";
                    echo $updateString."<br>";

                    if(!ObavitiOstaleUpit($updateString))
                    {
                        echo "Greška kod izmjene podataka vijesti!<br>";
                    }
                    else 
                    {
                        $updateRecenzijaString = "UPDATE Recenzija SET idVrsteRecenzije = 3 where idVjesti = ". $idVijesti.";";
                        echo $updateRecenzijaString."<br>";
                        if(!ObavitiOstaleUpit($updateRecenzijaString))
                        {
                            echo "Greška kod izmjene recenzije<br>";
                        }
                        else 
                        {
                            echo "Podatci o vijesti izmjenjeni!<br>";
                            header("Location: https://". $_SERVER["HTTP_HOST"] . "/WebDiP/2021_projekti/WebDiP2021x008/pregledVijesti.php");
                        }
                    }
                }
                else 
                {
                    echo "Vijest nije na doradi!<br>";
                    //header("Location: https://". $_SERVER["HTTP_HOST"] . "/WebDiP/2021_projekti/WebDiP2021x008/pregledVijesti.php");
                }
            }
            
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Izmjena vijesti</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">

        <link rel="stylesheet" href="CSS/vijest.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JavaScript/izmjenaVijesti.js"></script>
        
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
        <h3>Izmjena vijesti</h3>
            <?php
                if(isset($_POST['idVijesti']))
                {
                    IzmjenaPostojeceVijesti();
                }
             ?>
            <input type="hidden" id="idVjest" value="<?php echo $_GET['idVijesti']?>">
            <?php PostavljanjeVrijednostiVijesti(); ?>

            <div id="tablica greška">
                <h3>Greške</h3>
                <button id="prosliButton">Prosla</button>
                <button id="sljedeciButton">Sljedeca</button>
                <div id="brojStranice"></div>
                
                <div id="galerijaPogreška">Tablica test</div>
            </div>
            
        </section>

        <footer>

        </footer>
    </body>
</html>