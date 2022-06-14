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
    odDatumVrijeme = "'" + $("#odInput").val() + " 00:00:00'";
    doDatumVrijeme = "'" + $("#doInput").val() + " 23:59:59'";
    if((odDatumVrijeme === "' 00:00:00'" || doDatumVrijeme === "' 23:59:59'"))
    {
        var podatci = {
            'brojElementaPoStranici'  :brojElementaPoStranici,
            'brojStranice'            :brojStranice,
            'sortiranje'              :($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'brojPregleda' : 'naslov'
        }
    }
    else
    {
        var podatci = {
            'brojElementaPoStranici'  :brojElementaPoStranici,
            'brojStranice'            :brojStranice,
            'odDatumVrijeme'          :odDatumVrijeme,
            'doDatumVrijeme'          :doDatumVrijeme,
            'sortiranje'              :($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'brojPregleda' : 'naslov'
        }
    }
    //podatci["sortiranje"] = ($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'brojPregleda' : 'naslov';
    //console.log(podatci);
    
    $.ajax(
        {
            method      :"GET",
            url         :"PHPFunkcijskiPaketi/dohvacanjeVijesti.php",
            data        :podatci,
            datatype    :"json",
            success     : function(tablica){
                //sadrzajGalerije = "<table> <tr> <th>Naslov</th> <th>Slika</th> <th>Datum objave</th> <th>Broj pregleda</th> </tr>";
                sadrzajGalerije = "<table>";
                //console.log(tablica);
                tablica = JSON.parse(tablica);

                $.each(tablica ,function(key, vijest){
                    sadrzajGalerije += "<tr> <td><a href=\"vijest.php?idVijesti=" + vijest['id'] + "\">" + vijest['naslov']+ "</a></td> <td> <img src=\"" + vijest['slika'] +  "\"></td> <td>" + vijest['datumvrijemeKreiranja'] + "</td> <td>" + vijest['brojPregleda'] +"</td> </tr>";
                    //console.log(key + ":" + vijest);
                });
                sadrzajGalerije += "</table>"
                //console.log(sadrzajGalerije);
                $("#galerijaVijesti").html(sadrzajGalerije);
            }
        }
    );
}

/*function stvaranjeGalerije(tablicaPodataka)
{
    sadrzajGalerije = "<table> <tr> <th>Naslov</th> <th>Datum objave</th> </tr>";
    $(tablicaPodataka).forEach(element => {
        sadrzajGalerije += "<tr> <td>" + element["naslov"]+ "</td> <td>" + element["datumvrijemeKreiranja"] + "</td> <tr>";
    });
    sadrzajGalerije += "</table>"
    $("#galerijaVijesti").text(sadrzajGalerije);
}*/

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

        $("#odInput").change(function()
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

        $("#doInput").change(function()
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
    }
);