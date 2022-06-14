<?php
    require_once('PHPFunkcijskiPaketi/radSaBazom.php');
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
    $brojPregleda = $vijest['brojPregleda'] + 1;

    $updateStringBrojPregleda = "UPDATE Vijest SET brojPregleda = ".$brojPregleda." where id = ". $vijest['id'].";";
    ObavitiOstaleUpit($updateStringBrojPregleda);

?>

<html lang="hr">
    <head>
        <title id="titleVijesti"><?php echo $vijest['naslov'] ?></title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">

        <link rel="stylesheet" href="CSS/vijest.css">
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
            <h3 id="naslovVijesti"><?php echo $vijest['naslov'] ?></h3>
            <div id="slikaVijesti"><img src="<?php echo $vijest['slika'] ?>"></div>
            <div id="textVijesti"><?php echo $vijest['tekst'] ?></div>
            <div id="izvorVijesti"><a href="<?php echo $vijest['urlIzvora'] ?>"><?php echo $vijest['urlIzvora'] ?></a></div>
        </section>

        <footer>

        </footer>
    </body>
</html>