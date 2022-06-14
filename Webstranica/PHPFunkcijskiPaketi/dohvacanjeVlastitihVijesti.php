<?php
    require("radSaBazom.php");
    session_start();
    if(isset($_GET['brojElementaPoStranici']))
    {
        $brojElementaStranice = $_GET['brojElementaPoStranici'];
    }
    else {
        $brojElementaStranice = 3;
    }

    if(isset($_GET['brojStranice']))
    {
        $brojStranice = $_GET['brojStranice'];
    }
    else {
        $brojStranice = 1;
    }

    $offsetElementa = "".(($brojStranice - 1) * $brojElementaStranice);

    if(isset($_GET['odDatumVrijeme']) && isset($_GET['doDatumVrijeme']))
    {
        $selectString = "SELECT v.id as id, v.naslov as naslov, v.slika as slika, v.datumvrijemeKreiranja as datumvrijemeKreiranja, v.brojPregleda as brojPregleda, s.nazivSTanja as nazivSTanja FROM Vijest v INNER JOIN Recenzija r ON v.id = r.idVjesti INNER JOIN StanjeRecenzije s ON r.idVrsteRecenzije = s.id where (datumvrijemeKreiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and v.idKreator = ".$_SESSION['korisnik']['id']." order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT v.id as id, v.naslov as naslov, v.slika as slika, v.datumvrijemeKreiranja as datumvrijemeKreiranja, v.brojPregleda as brojPregleda, s.nazivSTanja as nazivSTanja FROM Vijest v INNER JOIN Recenzija r ON v.id = r.idVjesti INNER JOIN StanjeRecenzije s ON r.idVrsteRecenzije = s.id where v.idKreator = ".$_SESSION['korisnik']['id']." order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    $tablicaVijesti = ObavitiSelectUpit($selectString);
    $tablica = [];
    while($vijest = mysqli_fetch_assoc($tablicaVijesti))
    {
        $tablica[] = $vijest;
    }
    
    /*foreach ($tablica as $vijest) {
        echo json_encode($vijest);
    }*/

    echo json_encode($tablica);
    //echo $selectString; 
    exit;
?>