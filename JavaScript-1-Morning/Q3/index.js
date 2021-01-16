
document.getElementById("add").onclick = function() {
    //alert("ok");
    let n1 = document.getElementById("num1").value;
    let n2 = document.getElementById("num2").value;
    if (isNaN(Number(n1)) || isNaN(Number(n2))) {
        alert("Please input numbers");
    }
    else {

        document.getElementById("sum").innerHTML = "Sum: " + (Number(n1) + Number(n2)).toString();
    }
} 