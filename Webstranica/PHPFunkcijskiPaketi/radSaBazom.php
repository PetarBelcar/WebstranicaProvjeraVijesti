<?php
    require_once 'konfiguracija.php';

    $baza;

    function SpojitiSeNaBazu()
    {
        global $server, $user, $pass, $dataBase, $baza, $charset;

        if(!$baza)
        {
            $baza = mysqli_connect($server, $user, $pass, $dataBase);

            if(!$baza)
            {
                echo "Neuspješno spajanje na bazu!<br>";
            }

            mysqli_set_charset($baza ,$charset);
        }
    }

    function ObavitiSelectUpit($selectString)
    {
        SpojitiSeNaBazu();

        global $baza;

        $selectUpit = mysqli_query($baza, $selectString);
        if(!$selectUpit)
        {
            return false;
        }

        return $selectUpit;
    }

    function ObavitiOstaleUpit($ostaliUpitString)
    {
        SpojitiSeNaBazu();

        global $baza;

        $ostaliUpit = mysqli_query($baza, $ostaliUpitString);

        if(!$ostaliUpit)
        {
            return false;
        }

        return true;
    }

    function OdspojitiSeOdBaze()
    {
        global $baza;

        if(!$baza)
        {
            echo "Baza se nemože odspojiti jer nije spojena!";
            return false;
        }
        else if(!mysqli_close($baza))
        {
            echo "Baza nije odspojena!";
            return false;
        }

        return true;
    }

    function VratiBrojRedovaUZahtjevu($brojUpitiString)
    {
        $selectUpit = ObavitiSelectUpit($brojUpitiString);

        return mysqli_num_rows($selectUpit);
    }
?>