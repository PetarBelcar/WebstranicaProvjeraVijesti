<?php
    $locVirtualnogVremena = "http://barka.foi.hr/WebDiP/pomak_vremena/pomak.php?format=json";

    function DohvatiPomakVirtualnogVremena()
    {
        global $locVirtualnogVremena;
        $fileVirtualnogVremena = fopen($locVirtualnogVremena, 'r');
        if(!$fileVirtualnogVremena)
        {
            echo "Virtualno vrijeme: greška kod otvaranja stranice.";
            return 0;
        }

        $sadrzajStraniceVirtualnogVremena = fread($fileVirtualnogVremena, 10000);
        $jsonVirtualnogVremena = json_decode($sadrzajStraniceVirtualnogVremena, false);
        $pomakUSatima = $jsonVirtualnogVremena->WebDiP->vrijeme->pomak->brojSati;
        echo $pomakUSatima."<br>";

        fclose($fileVirtualnogVremena);

        return $pomakUSatima;
    }

    function MojDatumVrijeme($format)
    {
        if ($format == false)
        {
            $format = "Y-m-d H:i:s";
        }

        return date($format, MojeVrijemeUnix());
    }

    function MojeVrijemeUnix()
    {
        return time() + ProcitajDohvaceniPomakVirtualnogVremena() * 60 * 60;   
    }

    function PreuzetiPomakVirtualnogVremena()
    {
        $fileZaPomak = fopen("pomak.txt","w");
        
        fwrite($fileZaPomak, DohvatiPomakVirtualnogVremena());

        fclose($fileZaPomak);
    }

    function ProcitajDohvaceniPomakVirtualnogVremena()
    {
        if(!$fileZaPomak = fopen("pomak.txt", "r"))
        {
            return 0;
        }
        $izrazIzFilea = fread($fileZaPomak, 1000);
        $izrazIzFilea += 0;
        
        fclose($fileZaPomak);
        return $izrazIzFilea;
    }
?>