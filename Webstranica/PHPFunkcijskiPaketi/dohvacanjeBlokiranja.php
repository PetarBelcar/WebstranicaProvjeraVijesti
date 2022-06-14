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
        $selectString = "SELECT k.naziv as naziv, b.datumvrijemeDoIstekaBlokiranja as datumvrijemeDoIstekaBlokiranja from BlokiraniKorisnik b INNER JOIN KategorijeVijesti k ON b.idKategorijeVijesti = k.id where (datumvrijemeDoIstekaBlokiranja between ".$_GET['odDatumVrijeme']." and ".$_GET['doDatumVrijeme'].") and b.idBlokiranogKorisnika = ".$_SESSION['korisnik']['id']." order by naziv LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
    }

    else 
    {
        $selectString = "SELECT k.naziv as naziv, b.datumvrijemeDoIstekaBlokiranja as datumvrijemeDoIstekaBlokiranja from BlokiraniKorisnik b INNER JOIN KategorijeVijesti k ON b.idKategorijeVijesti = k.id  where b.idBlokiranogKorisnika = ".$_SESSION['korisnik']['id']." order by naziv desc LIMIT ".$brojElementaStranice." OFFSET ".$offsetElementa.";";
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