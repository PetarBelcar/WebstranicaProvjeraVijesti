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
        $selectString = "SELECT * FROM BlokiraniKorisnik bk INNER JOIN Korisnik k on k.id = bk.idBlokiranogKorisnika INNER JOIN KategorijeVijesti kv on kv.id = bk.idKategorijeVijesti where (datumvrijemeDoIstekaBlokiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and bk.idModeratora = ".$_SESSION['korisnik']['id']." order by ".$_GET['sortiranje']." LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT * FROM BlokiraniKorisnik bk INNER JOIN Korisnik k on k.id = bk.idBlokiranogKorisnika INNER JOIN KategorijeVijesti kv on kv.id = bk.idKategorijeVijesti where bk.idModeratora = ".$_SESSION['korisnik']['id']." order by ".$_GET['sortiranje']." LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
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