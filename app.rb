#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base

  validates :name, presence: true, # means field can't be empty
            length: { minimum: 3 }

  validates :phone, presence: true,
            length: {minimum: 9}
  validates :address, presence: true,
            length: {minimum: 10}                  

end 

get '/' do
    
    @products = Product.all
     erb :index

end #get index

get '/about' do

     erb :about

end # get about

post '/cart' do

	orders_input = params[:orders]
    
    @items = pars_orders_input orders_input
    if @items.length == 0
    	erb :cart_is_empty
    else
      @items.each do |item| # changing id with product object
         item[0] = Product.find(item[0])
      end #each do
	  erb :cart
	end #else
end

 def pars_orders_input orders_input

	orders_input = orders_input.split(/,/)
    final_orders = []	
    orders_input.each do |order|

       s2 = order.split(/=/)
       s3 = s2[0].split(/_/)
       indx = s3[1]
       qnt = s2[1]
       arr2 = [indx,qnt]
	   final_orders.push arr2
    end
    
    return final_orders
end #def pars

post '/place_order' do
   
   @o = Order.new params[:cart_order]
   @hh = {}
   @hh = params[:cart_order]
   if (@o.save)
   	   erb :order_summary      
   else
   	  @error = @o.errors.full_messages.first
      #erb :cart
       
   end #if

end #post order

get '/orders' do
   
	@orders = Order.all
    erb :orders
   
end #get orders

