<?php
    require_once('PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php');
    require_once('PHPFunkcijskiPaketi/virtualnoVrijeme.php');
    require_once('PHPFunkcijskiPaketi/generiranje_navigacije.php');
    require_once('PHPFunkcijskiPaketi/sesija.php');

    require_once('PHPFunkcijskiPaketi/radSaBazom.php');
    require_once('PHPFunkcijskiPaketi/konfiguracija.php');
    require_once('PHPFunkcijskiPaketi/provjeraPostojanjaUBazi.php');

    function PromjenitiEmail()
    {
        if(isset($_GET['lozinkaEmail']))
        {
            $email = $_GET['lozinkaEmail'];
            //echo $email."<br>";
            if(ProvjeritiJeLiEmailZauzetPHP($email))
            {
                $selectString = "SELECT * FROM Korisnik where email = '".$email."';";
                $selectUpit = ObavitiSelectUpit($selectString);
                $korisnik = mysqli_fetch_assoc($selectUpit);

                $novaLozinka = rand()."";
                $novaLozinkaSHA256 = hash("sha256", $novaLozinka.";".$korisnik['datumRegistracije']);
                $updateString  = "UPDATE Korisnik SET lozinka = '".$novaLozinka."', lozinkaSHA256 = '".$novaLozinkaSHA256."' WHERE id = ".$korisnik['id'].";";
                if(!ObavitiOstaleUpit($updateString))
                {
                    echo "Lozinka nije updatana!<br>";
                }
                else 
                {
                    if(!mail($email, "Nova lozinka WebDiP_Projekt_BelcarPetar", "Nova lozinka za vas korisnicki racun je \"".$novaLozinka."\""))
                    {
                        echo "Greška kod slanja emaila!<br>";
                    }
                    else 
                    {
                        echo "Nova lozinka je poslana na email!<br>";
                    }
                }
            }
            else {
                echo "Korisnicki racun s tim emailom nepostoji!<br>";
            }
        }
    }
    
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Zaboravljena lozinka</title>
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
            <h3> Zaboravljena lozinak</h3>
            <div><?php PromjenitiEmail()?></div>
            <form method="GET" action="zaboravljenaLozinka.php">
                <label for="">Email: </label>
                <input type="text" id="inputEmail" name="lozinkaEmail"><br>
                <input type="submit" value="Pošalji">
            </form>
        </section>

        <footer>

        </footer>
    </body>
</html>