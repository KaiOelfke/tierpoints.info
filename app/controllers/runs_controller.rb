class RunsController < ApplicationController
  before_action :authenticate_logged_in
  rescue_from ActionController::InvalidAuthenticityToken, with: :authenticate_logged_in

  def new
    @run = Run.new()
  end

  def create
    @run = Run.new(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to root_path, flash: {success: 'Run was successfully created'} }
      else 
        format.html { render :new }
      end
    end
  end

  private

  def run_params
    params.require(:run).permit(:departure_airport, :arrival_airport, :carrier, :booking_class, :tp, :price, :itinerary)
  end

  # def force_log_out
  #   redirect_to root_path, alert: 'You need to sign in again'
  # end

  def authenticate_logged_in
    redirect_to root_path, alert: 'Not logged in.' unless user_signed_in?
  end

end
