require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylists)
end

post("/clients") do
  client_name = params.fetch("client_name")
  # id = params.fetch("id").to_i()
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylists)
end

post("/stylist") do
  stylist_name = params.fetch("stylist_name")
  stylist_list = Stylist.new({:stylist_name => stylist_name, :id => nil})
  stylist_list.save()
  @stylists = Stylist.all()
  erb(:index)
end
