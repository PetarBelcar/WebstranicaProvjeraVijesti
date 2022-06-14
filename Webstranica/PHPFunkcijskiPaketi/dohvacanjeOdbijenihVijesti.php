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
        $selectString = "SELECT * FROM Vijest v INNER JOIN Recenzija r ON v.id = r.idVjesti INNER JOIN Korisnik k ON k.id = v.idKreator INNER JOIN ModeratorKategorije mk ON v.idKategorijeVijesti = mk.idKategorijeVijesti where (datumvrijemeKreiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and mk.idModeratora = ".$_SESSION['korisnik']['id']." and r.idVrsteRecenzije = 2 LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT * FROM Vijest v INNER JOIN Recenzija r ON v.id = r.idVjesti INNER JOIN Korisnik k ON k.id = v.idKreator INNER JOIN ModeratorKategorije mk ON v.idKategorijeVijesti = mk.idKategorijeVijesti where r.idVrsteRecenzije = 2 and mk.idModeratora = ".$_SESSION['korisnik']['id']." LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
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