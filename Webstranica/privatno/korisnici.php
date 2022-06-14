<?php
    require_once '../PHPFunkcijskiPaketi/radSaBazom.php';

    function DohvatitAsocijativniNizKorisnika()
    {
        $selectString = "select korisnickoIme, lozinka from Korisnik;";
        $arrayKorisnika = ObavitiSelectUpit($selectString);

        echo "<table> <tr> <th>Korisnicko ime</th> <th>Lozinka</th> </tr>";
        foreach ($arrayKorisnika as $korisnik) {
            echo "<tr> <td>".$korisnik["korisnickoIme"]."</td> <td>".$korisnik["lozinka"]."</td> </tr>";
        }
        echo "</table>";
    }
?>
<html>
    <head>
    </head>
    
    <body>
        <?php DohvatitAsocijativniNizKorisnika(); ?>
    </body>
</html>