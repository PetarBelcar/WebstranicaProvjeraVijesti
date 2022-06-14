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
            'sortiranje'              :($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'korisnickoIme' : 'naslov'
        }
    }
    else
    {
        var podatci = {
            'brojElementaPoStranici'  :brojElementaPoStranici,
            'brojStranice'            :brojStranice,
            'odDatumVrijeme'          :odDatumVrijeme,
            'doDatumVrijeme'          :doDatumVrijeme,
            'sortiranje'              :($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'korisnickoIme' : 'naslov'
        }
    }
    //podatci["sortiranje"] = ($("#selektiranjeKriterijaSortiranja").val() == 1) ? 'brojPregleda' : 'naslov';
    //console.log(podatci);
    
    $.ajax(
        {
            method      :"GET",
            url         :"PHPFunkcijskiPaketi/dohvacanjeOdbijenihVijesti.php",
            data        :podatci,
            datatype    :"json",
            success     : function(tablica){
                sadrzajGalerije = "<table> <tr> <th>Naslov</th> <th>Korisnik</th> <th>Datum objave</th> </tr>";
                //sadrzajGalerije = "<table>";
                //console.log(tablica);
                tablica = JSON.parse(tablica);

                $.each(tablica ,function(key, vijest){
                    sadrzajGalerije += "<tr> <td><a href=\"vijest.php?idVijesti=" + vijest['idVjesti'] + "\">"+vijest['naslov']+"</a></td> <td><a href=\"blokiratiKorisnika.php?idKorisnika="+vijest['idKreator']+"&idKategorije="+vijest['idKategorijeVijesti']+"&azuriranje=0\">"+vijest['korisnickoIme']+"</a></td> <td>"+vijest['datumvrijemeKreiranja']+"</td> </tr>";
                    //console.log(key + ":" + vijest);
                });
                sadrzajGalerije += "</table>"
                //console.log(sadrzajGalerije);
                $("#tablicaOdbijenihVijesti").html(sadrzajGalerije);
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