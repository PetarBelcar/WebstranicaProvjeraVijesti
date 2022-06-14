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

    $selectString = "SELECT p.id, p.idRecenzije, vg.nazivGreške, p.pocetakGreske, p.krajGreske, p.opis FROM Pogreske p inner join VrstaGreške vg on vg.id = p.VrstaGreške_id inner join Recenzija r on r.id = p.idRecenzije where r.idVjesti = ".$_GET['idVjest']." and r.idVjesti = ".$_GET['idVjest']." limit ".$brojElementaStranice." offset ".$offsetElementa.";";

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