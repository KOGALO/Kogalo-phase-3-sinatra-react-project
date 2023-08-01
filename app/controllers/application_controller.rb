require_relative '../models/Landlord'
require_relative '../models/House'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

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
    @landlord.to_json
    end
  end

  delete "/landlords/:id" do
    @landlord = Landlord.find(params[:id])
    @landlord.destroy
  end

  post "/houses" do
    @house = House.new(params[:name], params[:address], params[:price_per_month])
    @house.to_json
  end

  get "/houses" do
    @houses = House.all
    @houses.to_json
  end
