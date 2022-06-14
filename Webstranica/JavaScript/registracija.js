function ProvjeritiEmail(upisaniEmail)
{
    var vratiVrijednost;
    $.ajax({
        type: "GET",
        url: "PHPFunkcijskiPaketi/provjeraPostojanjaUBazi.php",
        data: {'email': upisaniEmail},
        dataType: "text",
        success: function (response) {
            if(response == 1 || !ProvjeritiFormatEmaila(upisaniEmail))
            {
                //console.log("Crveno")
                $("#emailRegistracija").attr("style", "background-color:red");
                vratiVrijednost = false;
            }
                
            else
            {
                //console.log("Zeleno")
                $("#emailRegistracija").attr("style", "background-color:green")
                vratiVrijednost = true;
            }
        }
    });
    return vratiVrijednost;
}

function ProvjeritiKorisnickogImena(upisanoKorIme, upisanaLozinka)
{
    $.ajax({
        type: "GET",
        url: "PHPFunkcijskiPaketi/provjeraPostojanjaUBazi.php",
        data: {'korisnickoIme': upisanoKorIme},
        dataType: "text",
        success: function (response) {
            console.log(response);
            console.log("Naden u bazi:" + response == 1);
            console.log("Ime je prazno:" + upisanoKorIme == "");
            console.log("Prekratko je:" + !ProvjeraDuzineKorisnickogImena(upisanoKorIme));
            console.log("Lozinka i korime su isiti:" + ProvjeraJednakostiKorImenaLozinke(upisanoKorIme, upisanaLozinka));
            console.log("Ukupno:" + response.length === 1 || upisanoKorIme == "" || !ProvjeraDuzineKorisnickogImena(upisanoKorIme) || ProvjeraJednakostiKorImenaLozinke(upisanoKorIme, upisanaLozinka));
            if(response == 1 || upisanoKorIme == "" || !ProvjeraDuzineKorisnickogImena(upisanoKorIme) || ProvjeraJednakostiKorImenaLozinke(upisanoKorIme, upisanaLozinka))
            {
                console.log("Crveno")
                $("#korImeRegistracija").attr("style", "background-color:red");
            }

            else
            {
                console.log("Zeleno")
                $("#korImeRegistracija").attr("style", "background-color:green")
            }
        }
    });
}

function ProvjeriJednakostLozinke(upisanaLozinka, upisanaLozinkaPotvrda)
{
    if(upisanaLozinka === upisanaLozinkaPotvrda) return true;
    else return false;
}

function ProvjeraJednakostiKorImenaLozinke(upisanoKorIme, upisanaLozinka)
{
    if(upisanoKorIme === upisanaLozinka) return true;
    else return false;
}

function ProvjeriJeLiLozinkaPassword(upisnaLozinka)
{
    if(upisnaLozinka.toLowerCase() == "password" || upisnaLozinka.toLowerCase() == "lozinka") return true;
    else return false;
}

function ProvjeriSadrziLiLozinkaZnak(lozinka)
{
    if(lozinka.includes(";")) return true;
    else return false;
}

function PostavitiPoljaLozinka()
{
    lozinka = $("#lozinkaRegistracija").val();
    lozinkaPotvrda = $("#lozinkaPotvrdaRegistracija").val();
    korisnickoIme = $("#korImeRegistracija").val();
    if(!ProvjeriJednakostLozinke(lozinka, lozinkaPotvrda) || ProvjeriJeLiLozinkaPassword(lozinka) || ProvjeriSadrziLiLozinkaZnak(lozinka))
    {
        $("#lozinkaRegistracija").attr("style", "background-color:red");
        $("#lozinkaPotvrdaRegistracija").attr("style", "background-color:red");
    }
    else
    {
        $("#lozinkaRegistracija").attr("style", "background-color:green");
        $("#lozinkaPotvrdaRegistracija").attr("style", "background-color:green");
    }
}

function ProvjeritiFormatEmaila(upisaniEmail)
{
    var emailRegExp = /[\w\d]{3,}@\w{3,}.\w{2,}/;
    return emailRegExp.test(upisaniEmail);
}

function ProvjeraDuzineKorisnickogImena(korisnickoIme)
{
    var korisnickoImeRegExp = /[\w\d]{5,100}/;
    return korisnickoImeRegExp.test(korisnickoIme);
}

$(document).ready(function()
{
    console.log();
    $("#korImeRegistracija").keyup(function()
    {
        ProvjeritiKorisnickogImena($("#korImeRegistracija").val(), $("#lozinkaRegistracija").val());
    });

    $("#emailRegistracija").keyup(function()
    {
        ProvjeritiEmail($("#emailRegistracija").val());
    });

    $("#lozinkaRegistracija").keyup(function()
    {
        PostavitiPoljaLozinka();
    });

    $("#lozinkaPotvrdaRegistracija").keyup(function()
    {
        PostavitiPoljaLozinka();
    });
    $("#formaRegistracija").submit(function (e) { 
        e.preventDefault();
        recaptcha = grecaptcha.getResponse();
        captchBool = (recaptcha.length != 0) ? true : false;

        upisanoKorisnickoIme = $("#korImeRegistracija").val();
        upisanaLozinka = $("#lozinkaRegistracija").val();
        upisanaLozinkaPotvrda = $("#lozinkaPotvrdaRegistracija").val();
        upisaniEmail = $("#emailRegistracija").val();
        if(!ProvjeriJednakostLozinke(upisanaLozinka, upisanaLozinkaPotvrda) || ProvjeraJednakostiKorImenaLozinke(upisanoKorisnickoIme, upisanaLozinka) || !ProvjeraDuzineKorisnickogImena(upisanoKorisnickoIme) || !ProvjeritiFormatEmaila(upisaniEmail) || ProvjeriJeLiLozinkaPassword(upisanaLozinka) || !captchBool || ProvjeriSadrziLiLozinkaZnak(upisanaLozinka))
        {
            alert("Unos podataka neisprvan!");
        }
        else
        {
            $(this).unbind('submit').submit();
        }
        
    });
});