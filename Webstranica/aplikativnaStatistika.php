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
        <script src="JavaScript/aplikativnaStatistika.js"></script>
    </head>

    <body>
        <header>

        </header>

        <nav>
            <a href="index.php">Aplikativna statistika</a>
            <a href="vijesti.php">Vijesti</a>
            <?php GenerirnjeNavigacijskihGumba() ?>

            <a href="dokumentacija.html">Dokumentacija</a>
            <a href="o_autoru.html">O autoru</a>
        </nav>

        <section>
            <h3>Aplikativna statistika</h3>
            <div>
                <button id="prosliButton">Prosla</button>
                <button id="sljedeciButton">Sljedeca</button>
                <select id="selektiranjeKriterijaSortiranja">
                    <option value="1" selected>Korisnickom imenu</option>
                    <option value="2">Broju prihvacenih vijesti</option>
                </select>
                <button id="sortirajButton">Sortiraj</button>
                <div id="brojStranice"></div>
                
                <div id="tablicaStatistike">Tablica test
                </div>
            </div>
        </section>

        <footer>

        </footer>
    </body>
</html>