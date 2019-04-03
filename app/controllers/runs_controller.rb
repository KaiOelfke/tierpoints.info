class RunsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]

  def new
    if !current_user.confirmed?
      redirect_to root_path, notice: 'Please confirm your email address before submitting a run.'
    end
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

  private
  def redirect_to_signup
    if !user_signed_in?
        store_location_for(:user, new_run_path)
        redirect_to new_user_registration_path
    end
  end

end
