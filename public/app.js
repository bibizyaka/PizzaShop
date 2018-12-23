unction add_to_cart(id) {
   
   var count = window.localStorage.getItem(id);
   count = count * 1 + 1; 
   window.localStorage.setItem(id, count);
   	

	alert("Added to Cart " +  count);
 


}  