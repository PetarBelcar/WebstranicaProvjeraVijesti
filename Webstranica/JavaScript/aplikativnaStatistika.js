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
    //console.log(brojElementaPoStranici + ":" + brojStranice)

    var podatci = {
        'brojElementaPoStranici'  :brojElementaPoStranici,            
        'brojStranice'            :brojStranice,
        'sortiranje'              :($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'korisnickoIme' : 'Prihvaceno'
    }

    //podatci["sortiranje"] = ($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'brojPregleda' : 'naslov';
    //console.log(podatci);
    
    $.ajax(
        {
            method      :"GET",
            url         :"PHPFunkcijskiPaketi/dohvacanjeAplikativneStatistike.php",
            data        :podatci,
            datatype    :"json",
            success     : function(tablica){
                sadrzajGalerije = "<table> <tr> <th>Korisnicko ime</th> <th>Prihvaćeno</th> <th>Odbijeno</th> <th>Omjer</th> </tr>";
                //sadrzajGalerije = "<table>";
                console.log(tablica);
                tablica = JSON.parse(tablica);

                $.each(tablica ,function(key, vijest){
                    prihvacenoTablica = (vijest['Prihvaceno'] != null) ? vijest['Prihvaceno']: 0;
                    odbijenoTablica = (vijest['Odbijeno'] != null) ? vijest['Odbijeno'] : 0;
                    odbijenoOmjer = (vijest['Odbijeno'] != null && vijest['Odbijeno'] > 0) ? vijest['Odbijeno'] : 1;
                    sadrzajGalerije += "<tr> <td>"+vijest['korisnickoIme']+"</td> <td>"+prihvacenoTablica+"</td> <td>"+odbijenoTablica+"</td> <td>"+prihvacenoTablica/odbijenoOmjer+"</td> </tr>";
                    //console.log(key + ":" + vijest);
                });
                sadrzajGalerije += "</table>"
                //console.log(sadrzajGalerije);
                $("#tablicaStatistike").html(sadrzajGalerije);
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


        $("#sortirajButton").click(function()
        {
            $.getJSON("JavaScript/konfiguracija.json", function(dataJSON)
            {
                brojStranice = 1;
                brojElementaPoStranici = dataJSON.brojElementaPoStranici;

                $("#brojStranice").text("Stranic: "+ brojStranice);
                EnableDisableButton(brojStranice);

                ucitavanjeNovihElementa(brojElementaPoStranici, brojStranice);
            });
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