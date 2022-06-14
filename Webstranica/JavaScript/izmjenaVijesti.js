function EnableDisableButton(brojStranice)
{
    //console.log(brojStranice);
    if(brojStranice > 1)
    {
        $("#prosliButton").prop("disabled", false);
        $("#sljedeciButton").prop("disabled", false);
    }
    else
    {
        $("#prosliButton").prop("disabled", true);
        $("#sljedeciButton").prop("disabled", false);
    }
}

function ucitavanjeNovihElementa(brojElementaPoStranici, brojStranice)
{
    idVjesti = $('#idVjest').val();
    
    var podatci = {
        'brojElementaPoStranici'  :brojElementaPoStranici,
        'brojStranice'            :brojStranice,
        'idVjest'                 :idVjesti
    }
    
    $.ajax(
        {
            method      :"GET",
            url         :"PHPFunkcijskiPaketi/dohvacanjePogreskeKorisnik.php",
            data        :podatci,
            datatype    :"json",
            success     : function(tablica){
                sadrzajGalerije = "<table> <tr> <th>Vrsta greške</th> <th>Početak greške</th> <th>Kraj greške</th> <th>Opis</th> </tr>";
                //sadrzajGalerije = "<table>";
                console.log(tablica);
                tablica = JSON.parse(tablica);

                $.each(tablica ,function(key, vijest){
                    pocetakGreske = (vijest['pocetakGreske'] != null) ? vijest['pocetakGreske'] : "Neovisno o poziciji";
                    krajGreske = (vijest['krajGreske'] != null) ? vijest['krajGreske'] : "Neovisno o poziciji";
                    sadrzajGalerije += "<tr> <td>" + vijest['nazivGreške'] + "</td> <td>" + pocetakGreske + "</td> <td>" + krajGreske + "</td>  <td>" + vijest['opis'] + "</td> </tr>";
                    //console.log(vijest['opis']);
                });
                sadrzajGalerije += "</table>"
                //console.log(sadrzajGalerije);
                $("#galerijaPogreška").html(sadrzajGalerije);
            }
        }
    );
}

$(document).ready(function()
    {
        var brojStranice = 1;
        EnableDisableButton(brojStranice);

        $.getJSON("JavaScript/konfiguracija.json", function(dataJSON)
        {
            brojElementaPoStranici = dataJSON['brojElementaPoStranici'];

            $("#brojStranice").text("Stranic: "+ brojStranice);
            EnableDisableButton(brojStranice);

            ucitavanjeNovihElementa(brojElementaPoStranici, brojStranice);
        });

        //event za dogadaj micanja po stranicama
        $("#prosliButton").click(function()
        {
            $.getJSON("JavaScript/konfiguracija.json", function(dataJSON)
            {
                brojStranice--;
                brojElementaPoStranici = dataJSON.brojElementaPoStranici;

                $("#brojStranice").text("Stranic: "+ brojStranice);
                EnableDisableButton(brojStranice);

                ucitavanjeNovihElementa(brojElementaPoStranici, brojStranice);
            });
        });

        $("#sljedeciButton").click(function()
        {
            $.getJSON("JavaScript/konfiguracija.json", function(dataJSON)
            {
                brojStranice++;
                brojElementaPoStranici = dataJSON.brojElementaPoStranici;

                $("#brojStranice").text("Stranic: "+ brojStranice);
                EnableDisableButton(brojStranice);

                ucitavanjeNovihElementa(brojElementaPoStranici, brojStranice);
            });
        });
    }
);