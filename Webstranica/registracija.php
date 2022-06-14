<?php
    require_once("PHPFunkcijskiPaketi/prihvacanjeUjetaKoristenja.php");

    require_once("PHPFunkcijskiPaketi/redirekcijaNaHTTPS.php");

    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");
    require_once("PHPFunkcijskiPaketi/generiranje_navigacije.php");
    require_once("PHPFunkcijskiPaketi/radSaBazom.php");
    
    function GeneriratiSHA256($lozinka, $datumvrijeme)
    {
        $stringZaEnkripciju = $lozinka.";".$datumvrijeme;
        return hash("sha256", $stringZaEnkripciju);
    }

    function UpisatiNovogKorisnika($korisnickoIme, $email, $lozinka, $datumvrijeme)
    {
        if($_POST['ime'] !== "" && $_POST['prezime'] !== "")
        {
            $unosString = "INSERT INTO Korisnik(korisnickoIme, lozinka, lozinkaSHA256, email, aktiviran, datumRegistracije, KategorijaKorisnika_id, uvjetiKoristenja, ime, prezime) values('".$korisnickoIme."', '".$lozinka."', '".GeneriratiSHA256($lozinka, $datumvrijeme)."', '".$email."', 0, '".$datumvrijeme."', 3, 0, '".$_POST['ime']."', '".$_POST['prezime']."')";
        }
        else if($_POST['ime'] !== "")
        {
            $unosString = "INSERT INTO Korisnik(korisnickoIme, lozinka, lozinkaSHA256, email, aktiviran, datumRegistracije, KategorijaKorisnika_id, uvjetiKoristenja, ime) values('".$korisnickoIme."', '".$lozinka."', '".GeneriratiSHA256($lozinka, $datumvrijeme)."', '".$email."', 0, '".$datumvrijeme."', 3, 0, '".$_POST['ime']."')";
        }
        else if($_POST['prezime'] !== "")
        {
            $unosString = "INSERT INTO Korisnik(korisnickoIme, lozinka, lozinkaSHA256, email, aktiviran, datumRegistracije, KategorijaKorisnika_id, uvjetiKoristenja, prezime) values('".$korisnickoIme."', '".$lozinka."', '".GeneriratiSHA256($lozinka, $datumvrijeme)."', '".$email."', 0, '".$datumvrijeme."', 3, 0, '".$_POST['prezime']."')";
        }
        else 
        {
            $unosString = "INSERT INTO Korisnik(korisnickoIme, lozinka, lozinkaSHA256, email, aktiviran, datumRegistracije, KategorijaKorisnika_id, uvjetiKoristenja) values('".$korisnickoIme."', '".$lozinka."', '".GeneriratiSHA256($lozinka, $datumvrijeme)."', '".$email."', 0, '".$datumvrijeme."', 3, 0)";
        }

        //echo $unosString."<br>";

        if(!ObavitiOstaleUpit($unosString))
        {
            echo "Novi korisnik nije upisan!<br>";
        }
        else 
        {
            $aktivacijskiKodPostavljen = false;
            while(!$aktivacijskiKodPostavljen)
            {
                $moguciAktivacijskiKod = rand();
                $selectString = "SELECT * FROM Korisnik WHERE aktivacijskiKod = '".$moguciAktivacijskiKod."'";
                if(mysqli_num_rows(ObavitiSelectUpit($selectString)) == 0)
                {
                    $updateString = "UPDATE Korisnik SET aktivacijskiKod = '".$moguciAktivacijskiKod."' WHERE korisnickoIme = '".$korisnickoIme."'";
                    if(ObavitiOstaleUpit($updateString))
                    {
                        $sadrzajEmaila = "Kliknite na link kako bi ste aktivirali korisnicki racun\n https://barka.foi.hr/WebDiP/2021_projekti/WebDiP2021x008/aktiviranjeKorisnickogRacuna.php?aktivacijskiKod=".$moguciAktivacijskiKod;
                        mail($email, "Aktivacija korisnickog racuna WebDiP_Projekt_PetarBelcar", $sadrzajEmaila);
                        $aktivacijskiKodPostavljen = true;
                        echo "Korisnik je registriran i poruka za aktivaciju je poslana!<br>";
                    }
                }
            }
        }
    }

    function ProvjeraPodatakaKorisnika()
    {
        if(isset($_POST['korisnickoIme']) && isset($_POST['email']) && isset($_POST['lozinka']) && isset($_POST['lozinkaPotvrda']) && isset($_POST['datumRegistracije']))
        {
            $regExpEmail = "/[\w\d]{3,}@\w{3,}.\w{2,}/";
            $regExpKorIme = "/[\w\d]{5,100}/";
            if(($_POST['lozinka'] === $_POST['lozinkaPotvrda']) && !(strtolower($_POST['lozinka']) === "lozinka" || strtolower($_POST['lozinka']) === "password") && !($_POST['korisnickoIme'] === $_POST['lozinka']) && preg_match($regExpEmail, $_POST['email']) && preg_match($regExpKorIme, $_POST['korisnickoIme']))
            {
                UpisatiNovogKorisnika($_POST['korisnickoIme'], $_POST['email'], $_POST['lozinka'], $_POST['datumRegistracije']);
            }
            else 
            {
                echo "Korisnik nije upisan!<br>";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Registracija</title>
        <meta charset="utf8">
        <link rel="stylesheet" href="CSS/generalni.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="JavaScript/registracija.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
            <h3>Registracija</h3>
            <div><?php ProvjeraPodatakaKorisnika() ?></div>
            <form id="formaRegistracija" method="POST" action="registracija.php">
                <label id="labelKorIme" for="korImeRegistracija">Korisnicko ime*:</label>
                <input type="text" id="korImeRegistracija" name="korisnickoIme" required><br>
                <label id="labelEmail" for="emailRegistracija">Email*:</label>
                <input type="text" id="emailRegistracija" name="email" required><br>
                <label for="lozinkaRegistracija">Lozinka*:</label>
                <input type="password" id="lozinkaRegistracija" name="lozinka" required><br>
                <label for="lozinkaPotvrdaRegistracija">Lozinka potvrda*:</label>
                <input type="password" id="lozinkaPotvrdaRegistracija" name="lozinkaPotvrda" required><br>
                <label for="imeRegistracije">Ime:</label>
                <input type="text" id="imeRegistracija" name="ime"><br>
                <label for="prezimeRegistracija">Prezime:</label>
                <input type="text" id="prezimeRegistracija" name="prezime"><br>
                <div class="g-recaptcha" data-sitekey="6Ldp_jIgAAAAADplqjITJO0C_J1K87UAeq6ER4wj"></div>
                <input type="hidden" name="datumRegistracije" value="<?php echo MojDatumVrijeme(false)?>">
                <p> Elementi označeni sa * su obavezni </p>
                <input type="submit" value="Registriraj">
            </form>
        </section>

        <footer>

        </footer>
    </body>
</html>