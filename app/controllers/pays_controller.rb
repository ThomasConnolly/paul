class PaysController < ApplicationController
  def new
    @donation = Donation.find(params[:id])
  end
end