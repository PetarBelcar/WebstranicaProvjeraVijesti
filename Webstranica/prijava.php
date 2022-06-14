<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/redirekcijaNaHTTPS.php");
    require_once("PHPFunkcijskiPaketi/konfiguracija.php");
    require_once("PHPFunkcijskiPaketi/provjeraPostojanjaUBazi.php");
    require_once("PHPFunkcijskiPaketi/sesija.php");    

    function prijava()
    {
        global $brojPrijavaZaZakljucavanje, $trajanjeCookiea;
        if(isset($_POST['korisnickoIme']) && isset($_POST['lozinka']))
        {
            $korisnickoIme = $_POST['korisnickoIme'];
            $lozinka = $_POST['lozinka'];

            if(ProvjeritiJeLiKorisnickoImeZauzetoPHP($korisnickoIme) == true)
            {
                $selectString = "SELECT * FROM Korisnik k where k.korisnickoIme = '".$korisnickoIme."';";
                //echo $selectString."<br>";
                $selectUpit = ObavitiSelectUpit($selectString);
                $korisnik = mysqli_fetch_assoc($selectUpit);
                $hashUpisaneLozinke = hash("sha256", $lozinka.";".$korisnik['datumRegistracije']);
                //echo $korisnik['lozinkaSHA256'].":". $hashUpisaneLozinke."<br>";
                
                if($korisnik['lozinkaSHA256'] == $hashUpisaneLozinke)
                {
                    echo "Lozinka je ispravna<br>";
                    //echo $_POST['zapamtiMe']."<br>";
                    if(isset($_POST['zapamtiMe']))
                    {
                        setcookie("korisnickoIme", $_POST['korisnickoIme'], MojeVrijemeUnix() + $trajanjeCookiea);
                    }
                    if($korisnik['aktiviran'] == 0 || ProvjeraJeLiKorisnickiRacunZakljucanPHP($korisnik['id']))
                    {
                        echo "Korisniciki racun ili nije aktiviran ili je zakljucan!<br>";
                    }
                    else 
                    {
                        //echo "Korisnik je uredu!<br>";
                        $updateString = "UPDATE Korisnik SET loginFailCount = 0 WHERE id = '".$korisnik['id']."';";
                        //echo $updateString."<br>";
                        if(!ObavitiOstaleUpit($updateString))
                        {
                            echo "Greška kod postavljanaj loginFailCount na 0<br>";
                        }
                        else 
                        {
                            $_SESSION['korisnik'] = $korisnik;
                        }
                    }
                    header("Location: http://".$_SERVER["HTTP_HOST"]."/WebDiP/2021_projekti/WebDiP2021x008/index.php");
                }
                else 
                {
                    echo "Lozinka je neispravna!<br>";
                    if($korisnik['loginFailCount'] == null)
                    {
                        echo "Postavljeni broj promasenih loginova na 1!<br>";
                        $updateString = "UPDATE Korisnik SET loginFailCount = 1 WHERE id = '".$korisnik['id']."';";
                    }
                    else if($korisnik['loginFailCount'] < $brojPrijavaZaZakljucavanje) 
                    {
                        echo "Povecan broj promasenih logina!<br>";
                        $updateString = "UPDATE Korisnik SET loginFailCount = ".($korisnik['loginFailCount'] + 1)." WHERE id = '".$korisnik['id']."';";
                    }
                    else 
                    {
                        echo "Racun zakljucan!<br>";
                        $updateString = "UPDATE Korisnik SET loginFailCount = ".($korisnik['loginFailCount'] + 1)." WHERE id = '".$korisnik['id']."';";
                        $zakljucavanjeString = "INSERT INTO ZakljucaniKorisnik(idKorisnika, datumvrijemeZakljucavanja) VALUE(".$korisnik['id'].", '".MojDatumVrijeme(false)."');";
                        ObavitiOstaleUpit($zakljucavanjeString);
                    }
                    //echo $updateString."<br>";
                    if(!ObavitiOstaleUpit($updateString))
                    {
                        echo "Greška kod povećavanja vrijednosti loginFailCounta!<br>";
                    }
                }
            }
            else {
                echo "Korisnik sa korisničkim računom nije naden!<br>";
            }
        }
    }

    function UpisKorisnickogImenea()
    {
        if(isset($_COOKIE['korisnickoIme']))
        {
            echo $_COOKIE['korisnickoIme'];
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Prijava</title>
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
            <h3>Prijava</h3>
            <div><?php prijava() ?></div>
            <form id="formaPrijava" method="POST" action="prijava.php">
                <label for="inputKorIme">Korisnicko ime:</label>
                <input type="text" id="inputKorIme" name="korisnickoIme" value="<?php UpisKorisnickogImenea() ?>"><br>
                <label for="inputLozinka">Lozinka:</label>
                <input type="password" id="inputLozinka" name="lozinka"><br>
                <label for="inputZapamtiMe">Zapamti me</label>
                <input type="checkbox" id="inputZapamtiMe" name="zapamtiMe"><br>
                <input type="submit" value="Prijava"><br>
            </form>

            <a href="zaboravljenaLozinka.php">Zaboravljena lozinka</a>
        </section>

        <footer>

        </footer>
    </body>
</html>