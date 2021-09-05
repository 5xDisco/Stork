function synchronize(){ 
    document.getElementById('i1').innerHTML =document.getElementById('i2').value; 
    } 
    setInterval(synchronize,500);