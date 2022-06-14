<?php
    require("radSaBazom.php");
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
        $selectString = "SELECT v.id, v.naslov, v.slika, v.datumvrijemeKreiranja, v.brojPregleda FROM Vijest v inner join Recenzija r on r.idVjesti = v.id where (datumvrijemeKreiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and r.idVrsteRecenzije = 1 order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT v.id, v.naslov, v.slika, v.datumvrijemeKreiranja, v.brojPregleda FROM Vijest v inner join Recenzija r on r.idVjesti = v.id where r.idVrsteRecenzije = 1 order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
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