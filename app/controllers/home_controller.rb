class HomeController < ApplicationController
  def index
    @runs = Run.all.includes(:segments)
  end

  def terms
  end

  def privacy
  end
end
