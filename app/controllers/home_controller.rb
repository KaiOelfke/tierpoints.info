class HomeController < ApplicationController
  def index
    @runs = Run.all
  end

  def terms
  end

  def privacy
  end
end
