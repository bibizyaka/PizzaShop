
    function total_prods_in_cart() {
	  
	     var total_prods = 0;
	     for (var i = 0; i < localStorage.length; i++) {
		
	       var key = window.localStorage.key(i);
	       var value = window.localStorage.getItem(key);

	         if (value) {
	         	
	         	total_prods = total_prods + (value * 1);
	         }
		}//for
		return total_prods;
	} // function

	function add_to_cart(id) {
	   
	   var count = window.localStorage.getItem("product_" + id);
	   count = count * 1 + 1; 
	   window.localStorage.setItem("product_" + id, count);	
	   alert("Added to Cart Product_" + id);

	   total_prods = total_prods_in_cart();
	   show_cart(total_prods);
	   update_input_orders();
	  
	  } //function

	function show_cart(total_prods) {
	    
	    //$('.totalCart').text(""); 
		$('.totalCart span').text("").text(" (" + total_prods * 1 + ")");
		//$('button.totalCart span').addClass("glyphicon glyphicon-shopping-cart");
	  
	} // function


	function get_orders() {

	 var orders = "";
	     for (var i = 0; i < localStorage.length; i++) {
		
	       var key = window.localStorage.key(i);
	       var value = window.localStorage.getItem(key);

	         if (value.indexOf("product_") != 0) {
	         	
	         	orders = orders + key + "=" + value + ",";
	         }
		}//for
		orders = orders.slice(0, -1);
		$('.test').val(orders);
		return orders;

	} // function

	function update_input_orders() {

	    orders = get_orders();
	   $('#orders').val(orders);

	}

$( document ).ready(function() {
	
	console.log("js file ready");

    total_prods = total_prods_in_cart();
	update_input_orders();
	show_cart(total_prods);


}); //ready
