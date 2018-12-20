class CreateProducts < ActiveRecord::Migration[5.2]
  def change

  	  create_table  :products do |p|   #will create table if it doesn't exist
          p.string  :title
          p.text    :description
          p.decimal :price
          p.decimal :size
          p.boolean :is_spicy
          p.boolean :is_veg
          p.boolean :is_best_offer
          p.string  :path_to_image
         

          p.timestamps  #automatically created 2 more datetime fields created_at, updated_at
  	 
  	  end
  end
end
