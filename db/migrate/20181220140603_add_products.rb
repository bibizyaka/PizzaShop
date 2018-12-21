class AddProducts < ActiveRecord::Migration[5.2]
  def change
       
       Product.create({
	        :title		   => 'Hawaiian',
	        :description   => 'Hawaiian Pizza',
	        :price 		   => 350, 
	        :size 		   => 30, 
	        :is_spicy 	   => false,
	        :is_veg        => false, 
	        :is_best_offer => false, 
	        :path_to_image => '/images/pizza1.jpg' # relative path
       })

       Product.create({
            :title         => 'Pepperoni',
            :description   => 'Nice Pepperoni Pizza',
            :price         => 450,
            :size          => 30, 
            :is_spicy      => false, 
            :is_veg        => false,
            :is_best_offer => true,
            :path_to_image => '/images/pizza2.jpg' # relative path
       })

      Product.create({
            :title  		=> 'Vegeterian', 
            :description    => 'Amaazing Vegeterian Pizza', 
            :price          => 400, 
            :size 		    => 30, 
            :is_spicy 		=> false, 
            :is_veg         => false, 
            :is_best_offer  => false, 
            :path_to_image  => '/images/pizza3.jpg' # relative path
       })

  end # def change
end
 