function createAddTable() {
    var numberInput1 = document.getElementById("num1");
    var numberInput2 = document.getElementById("num2");

    var tablesContainer = document.getElementById("tables-container");
    tablesContainer.innerHTML = "";

    for (var i = parseInt(numberInput1.value); i <= parseInt(numberInput2.value); i++) {
        var additionTable = document.createElement("table");
        for (var j = 1; j <= 10; j++) {
            var row = document.createElement("tr");
            var cell = document.createElement("td");
            cell.textContent = i + " + " + j + " = " + (i + j);
            row.appendChild(cell);
            additionTable.appendChild(row);
        }
        tablesContainer.appendChild(additionTable);
    }
}

function createMulTable() {
    var numberInput1 = document.getElementById("num1");
    var numberInput2 = document.getElementById("num2");

    var tablesContainer = document.getElementById("tables-container");
    tablesContainer.innerHTML = "";

    for (var i = parseInt(numberInput1.value); i <= parseInt(numberInput2.value); i++) {
        var multiplicationTable = document.createElement("table");
        for (var j = 1; j <= 10; j++) {
            var row = document.createElement("tr");
            var cell = document.createElement("td");
            cell.textContent = i + " × " + j + " = " + (i * j);
            row.appendChild(cell);
            multiplicationTable.appendChild(row);
        }
        tablesContainer.appendChild(multiplicationTable);
    }
}
