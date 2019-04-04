class HomeController < ApplicationController
  
  def index
    @runs = Run.all
    @tableDataJSON = @runs.to_json(:except => [:created_at, :updated_at, :carrier, :booking_class, :expire_date], :methods => [:human_price, :carrier_upcase, :booking_class_capitalize, :human_expire_date])
  end

  def terms
  end

  def privacy
  end

  def faq
  end
  
end
