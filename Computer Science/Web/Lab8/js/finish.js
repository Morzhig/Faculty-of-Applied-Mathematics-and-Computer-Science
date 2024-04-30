number = 0;
cont.onclick = function() {
    var name = document.getElementById('name').value;
    var num = document.getElementById('number').value;
    var adr = document.getElementById('address').value;
    var dep_date = document.getElementById('dep-date').value;

    if (name != 0 && num != 0 && adr != 0 && dep_date != 0){
        number++;

        var date = Date();
        var wiersz = document.createElement("tr");

        var tdText = document.createElement("td");
        tdText.innerHTML = `[Заказ #${number}]Пользователь ` + name + ' сделал заказ '+ date;
  
        wiersz.appendChild(tdText);
        var dodac = document.getElementById("orders");
        dodac.appendChild(wiersz);

        document.getElementById('ddname').textContent = name;
        document.getElementById('ddnum').textContent = num;
        document.getElementById('ddadr').textContent = adr;
        document.getElementById('dddate').textContent = dep_date;
    
        tdText.onclick = function() {
            document.location.href = 'order.html'

            var doc = document.getElementsByName('order.html');

            doc.getElementById('ddname').textContent = name;
            doc.getElementById('ddnum').textContent = num;
            doc.getElementById('ddadr').textContent = adr;
            doc.getElementById('dddate').textContent = dep_date;
        }

        document.getElementById('widget').onclick = function() {
            document.location.href = 'finish.html';
        }
    }
};
