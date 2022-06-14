<!DOCTYPE html>
<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");
?>

<html lang="hr">
    <head>
        <title>Vijesti</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">
        <link rel="stylesheet" href="CSS/vijesti.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JavaScript/vijesti.js"></script>
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
            <h3>Vijesti</h3>
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
                <select id="selektiranjeKriterijaSortiranja">
                    <option value="1" selected>Broj pregleda</option>
                    <option value="2">Naslov</option>
                </select>
                <button id="sortirajButton">Sortiraj</button>
                <div id="brojStranice"></div>
                
                <div id="galerijaVijesti">Tablica test
                </div>
            </div>
        </section>

        <footer>

        </footer>
    </body>
</html>