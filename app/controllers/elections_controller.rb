class ElectionsController < ApplicationController
  def create
    ballots = []
    create_params[:ballots].each do |ballot|
      options = []
      ballot[:options].each do |option_value|
        options << Option.new(value: option_value)
      end

      ballots << Ballot.new(name: ballot[:name], type: ballot[:type], options: options)
    end

    @election = Election.create(
      name: create_params[:name],
      ballots: ballots
    )

    render json: @election
  end

  private

  def create_params
    params.require([:name, :ballots])
    params.permit(:name, ballots: [:name, :type, options: []])
  end
end
