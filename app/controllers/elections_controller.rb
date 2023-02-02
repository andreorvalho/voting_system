class ElectionsController < ApplicationController
  def create
    ballots = []
    create_params[:ballots].each do |ballot|
      ballots << Ballot.create(ballot)
    end

    @election = Election.create(
      name: create_params[:name],
      ballots: ballots
    )

    render json: @election
  end

  private

  def create_params
    params.permit(:name, ballots: [:name, :type, options: []])
  end
end
