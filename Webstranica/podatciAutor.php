<!DOCTYPE html>
<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");

    function IzraditiStatistuku()
    {
        $selectString = "SELECT * FROM Vijest where idKreator = ".$_SESSION['korisnik']['id'].";";
        $selectUpit = ObavitiSelectUpit($selectString);
        if(!$selectUpit)
        {
            echo "Greška kod dohvaćanja podataka s baze!<br>";
        }
        else 
        {
            $sumPregleda = 0;
            $brojVijesti = 0;
            
            while ($vijest = mysqli_fetch_assoc($selectUpit)) 
            {
                $sumPregleda += $vijest['brojPregleda'];
                $brojVijesti += 1;
            }
            if($brojVijesti > 0)
            {
                echo "<table> <tr> <td>Ukupan broj pregleda vijesti</td> <td>".$sumPregleda."</td> </tr>
                <tr> <td>Prosječan broj pregleda po vijesti</td> <td>".round($sumPregleda / $brojVijesti)."</td> </tr>
                </table>";
            }
            else 
            {
                echo "<table> <tr> <td>Ukupan broj pregleda vijesti</td> <td>".$sumPregleda."</td> </tr>
                <tr> <td>Prosječan broj pregleda po vijesti</td> <td>0</td> </tr>
                </table>";
            }
        }
    }
?>

<html lang="hr">
    <head>
        <title>Podatci o autoru</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">
        <link rel="stylesheet" href="CSS/vijesti.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JavaScript/podatciAutor.js"></script>
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
            <h3>Blokiranja</h3>
            <div id="formaVijesti">
                <form>
                    <label for="odInput">Od: </label>
                    <input type="date" id="odInput" name="odInput">
                    <label for="doInput">Do: </label>
                    <input type="date" id="doInput" name="doInput">

                </form>
            </div>

            <div>
                <button id="prosliButton">Prosla</button>
                <button id="sljedeciButton">Sljedeca</button>
                
                <div id="tablicaBlokova">Tablica test
                </div>
            </div>

            <h3>Statistika</h3>
            <div id="statistikaDiv"><?php IzraditiStatistuku()?></div>
        </section>

        <footer>

        </footer>
    </body>
</html>