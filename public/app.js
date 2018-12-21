function something() {
 
   var x = window.localStorage.getItem('aaa');
   x = x * 1 + 1; 
   window.localStorage.setItem("aaa", x);
  
   alert(x);

}


funcion add_to_cart() {

	alert("Added to Cart!");

}