<?php
    require_once("PHPFunkcijskiPaketi/virtualnoVrijeme.php");

    function Vrijeme()
    {
        if(isset($_POST['preuzimanje']))
        {
            PreuzetiPomakVirtualnogVremena();

            echo "<p>Datum i vrijeme servera servera: ".MojDatumVrijeme(false)."</p>
            <p>Vrijme servera u unix time stampu: ".MojeVrijemeUnix()."</p>
            <p>Broj sati pomaka: ".ProcitajDohvaceniPomakVirtualnogVremena()."</p>";
        }
        else {
            echo "<p>Datum i vrijeme servera servera: ".MojDatumVrijeme(false)."</p>
            <p>Vrijme servera u unix time stampu: ".MojeVrijemeUnix()."</p>
            <p>Broj sati pomaka: ".ProcitajDohvaceniPomakVirtualnogVremena()."</p>";
        }
    }
?>
<!DOCTYPE html>
<html lang="hr">
    <head>
        <title>Postavljanje virtualnog vremena</title>
        <meta charset="utf8">
    </head>

    <body>
        <section>
            <a href="http://barka.foi.hr/WebDiP/pomak_vremena/vrijeme.html">Poveznica na stranicu za postavljanje virtualnog vremena.</a><br>
            <form method="POST" action="vrijeme.php">
                <input type="hidden" name="preuzimanje" value="1">
                <input type="submit" value="Preuzeti virtualno vrijeme">
            </form>

            <?php Vrijeme();?>
        </section>

        <footer>

        </footer>
    </body>
</html>