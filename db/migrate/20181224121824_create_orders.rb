class CreateOrders < ActiveRecord::Migration[5.2]
  def change
      	 
      	  create_table  :orders do |o|   #will create table if it doesn't exist
          o.string :name
          o.string :phone
          o.text   :address
          o.text   :order_details
      
          o.timestamps  #automatically created 2 more datetime fields created_at, updated_at
  	 
  	  end
  end
end
