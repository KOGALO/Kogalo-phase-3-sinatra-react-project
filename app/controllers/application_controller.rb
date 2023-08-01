class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  # app.rb

  # Define the routes and actions here
  before do
    content_type :json
  end

  get "/landlords" do
    @landlords = Landlord.all
    @landlords.to_json
  end

  get "/landlords/:id" do
    @landlord = Landlord.find(params[:id])
    @landlord.to_json
  end

  post "/landlords" do
    @landlord = Landlord.new(params[:name], params[:email], params[:phone_number])
    @landlord.to_json
  end

  put "/landlords/:id" do
    @landlord = Landlord.find(params[:id])
    @landlord.update(params[:landlord])
    end
  end

  delete "/landlords/:id" do
    @landlord = Landlord.find(params[:id])
    @landlord.destroy
  end

  post "/house_to_rent" do
    @house = HouseToRent.new(params[:name], params[:address], params[:price_per_month])
    @house.to_json
  end

  get "/house_to_rent" do
    @houses = HouseToRent.all
    @houses.to_json
  end
