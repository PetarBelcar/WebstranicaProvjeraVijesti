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

    $selectString = "SELECT k.id as id, k.korisnickoIme as korisnickoIme, SUM(sr.id = 1) as Prihvaceno, SUM(sr.id = 2) as Odbijeno FROM Korisnik k LEFT JOIN Vijest v on k.id = v.idKreator LEFT JOIN Recenzija r on r.idVjesti = v.id LEFT JOIN StanjeRecenzije sr on sr.id = r.idVrsteRecenzije group by id order by ".$_GET['sortiranje']." LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";

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