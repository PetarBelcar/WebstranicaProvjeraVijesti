<?php
    require_once('sesija.php');

    function GenerirnjeNavigacijskihGumba()
    {
        global $kategorijaKorisnika;
        if(isset($kategorijaKorisnika))
        {
            if($kategorijaKorisnika <= 3)
            {
                echo "<a href=\"odjava.php\">Odjava</a> <a href=\"pregledVijesti.php\">Pregled vijesti</a> <a href=\"podatciAutor.php\">Podatci o Autoru</a> ";
            }
            
            if($kategorijaKorisnika <= 2)
            {
                echo "<a href=\"recenzije.php\">Recenzije</a> <a href=\"blokiranje.php\">Odbijene vijesti</a> <a href=\"blokiraniKorisnici.php\">Blokirani korisnici</a> <a href=\"aplikativnaStatistika.php\">Aplikativna statistika</a>";
            }

            if($kategorijaKorisnika <= 1)
            {
                echo "";
            }
        }

        else 
        {
            echo "<a href=\"registracija.php\">Registracija</a> <a href=\"prijava.php\">Prijava</a> ";
        }
    }
?>