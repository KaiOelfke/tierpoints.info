class HomeController < ApplicationController
  
  def index
    @runs = Run.all
    @tableDataJSON = @runs.to_json(:except => [:created_at, :updated_at, :carrier, :booking_class], :methods => [:human_price, :carrier_upcase, :booking_class_capitalize])
  end

  def terms
  end

  def privacy
  end
end
