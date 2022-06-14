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
        $selectString = "SELECT * FROM Recenzija r INNER JOIN Vijest v on r.idVjesti = v.id WHERE (v.datumvrijemeKreiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and r.idModeratora = ".$_SESSION['korisnik']['id']." and r.idVrsteRecenzije = 3 order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT * FROM Recenzija r INNER JOIN Vijest v on r.idVjesti = v.id WHERE r.idModeratora = ".$_SESSION['korisnik']['id']." and r.idVrsteRecenzije = 3 order by ".$_GET['sortiranje']." desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
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