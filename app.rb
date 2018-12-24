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
    
	@orders = params[:orders]
	@orders = @orders.split(",")
	erb :cart

end #post cart

post '/order' do
  
   @o = Order.new params[:cart_order]
   if (@o.save)
        erb "<h2>Thank You! You are submitted!</h2>"
   else
   	  @error = @o.errors.full_messages.first
      #erb :cart
       
   end #if

end #post order