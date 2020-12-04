class ReferrerController < ApplicationController
  def index
    @referrer = Referrer.new
  end

  def create
    mobile_no = params["referrer"]["mob"]
    referrer = Referrer.find_by_mob(mobile_no)
    points = params["referrer"]["amount"].to_f / 100.0
    if referrer.present?
      referrer.points = referrer.points.to_i + points.to_i
      referrer.save 
    else
      Referrer.create(referrer_params.merge(points: points.to_i))
    end

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new Rails.application.credentials[:account_sid], Rails.application.credentials[:auth_token]
    @client.messages.create(from: Rails.application.credentials[:mob] ,to: "+91#{mobile_no}" , body: "Hi #{params["referrer"]["name"]}, From Amul you have points #{points}")
    redirect_to referrer_index_path
  end

  private
  def referrer_params
    params.require(:referrer).permit(:name, :email, :mob, :amount, :points)    
  end
end
