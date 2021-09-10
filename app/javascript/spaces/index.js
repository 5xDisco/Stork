function synchronize(){ 
    const item_1 = document.getElementById('step1-txtshow');
    const item_2 = document.getElementById('step1-txtinput');
        if(item_1 && item_2){
            item_1.innerHTML = item_2.value; 
        }
    } 
    const id = setInterval(synchronize,1000);
    
    
