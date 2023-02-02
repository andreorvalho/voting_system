class RegistrationsController < ApplicationController
  def create
    @registration = Registration.create(create_params)
    render json: @registration
  end

  private

  def create_params
    params.require([:voter_id, :election_id])
    params.permit(:voter_id, :election_id)
  end
end
