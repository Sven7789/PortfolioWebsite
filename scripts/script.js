/*
    Auteur: Sven Nieuwenhuizen
    Aanmaakdatum: 12/10/2022 08:07

    Omschrijving: Resultaten script
*/


var Grades = [
    pointsREA = [6.0,6.4,5.8,7.0],
    pointsCOM = [7.0,8.0,6.7,6.7],
    pointsPO  = [6.8,6.0,6.6,7.1],
    pointsTV  = [6.5,8.0,5.6,6.0],
    pointsNE  = [5.9,5.0,6.5,6.0],
    pointsEN  = [8.4,10.0,6.6,8.0],
    pointsBUR = [8.0,8.0,4.0,6.0],
    pointsREK = [6.7,4.0,5.3,7.3]
];
/* Array van de vakken op school*/
var Lessons = ["Realiseren", "Computervaardigheden", "Plannen en Ontwerpen", "Testen en verbeteren", "Nederlands", "Engels", "Burgerschap"];

var table = "";
/* Functie die een tabel maakt en vult met de boven aangegeven punten*/
function Tablerow(Grades, Lessons, index)
{
    table += "<tr>";
    table += "<th>" + Lessons[index] + "</th>";
    for(var i = 0; i < Grades[index].length; i++)
    {
        table += "<td>" + Grades[index][i] + "</td>";
    }
    table += "<td>" + Average(Grades[index])+ "</td>";
    table += "</tr>";
}

/* Functies oproepen per vak*/
for(var j = 0; j < Lessons.length; j++)
{
    Tablerow(Grades, Lessons,j);
}


/*Functie die het gemiddelde berekend van de vakken doormiddel van het delen van de cijfers door de alle cijfers*/
function Average(Grade)
{
    var averageGrade = 0;
    for(i = 0; i < Grade.length; i++)
    {
        averageGrade += Grade[i];
    }
    return (averageGrade / Grade.length)
}
/*Verwerken naar HTML in de id Tabel*/
document.getElementById("Tabel").innerHTML = table;
    