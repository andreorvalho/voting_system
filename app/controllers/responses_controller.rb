class ResponsesController < ApplicationController
  def create
    election = Election.find(create_params[:election_id])
    voter = Voter.find(create_params[:voter_id])

    @responses = []
    election.ballots.each_with_index do |ballot, index|
      if ballot.options.empty?
        value = create_params[:responses][index]
        @responses << Response.create!(ballot: ballot, voter: voter, value: value)
      else
        option = ballot.options.where(value: create_params[:responses][index]).first
        @responses << Response.create!(ballot: ballot, voter: voter, option: option)
      end
    end

    render json: @responses
  end

  def update
    @response = Response.find(update_params[:id])

    if update_params[:value].present?
      @response.value = update_params[:value]
      @response.save!
    elsif update_params[:option].present?
      @response.option = response.ballot.options.where(value: update_params[:option]).first
      @response.save!
    end

    render json: @response
  end

  private

  def create_params
    params.require([:voter_id, :election_id, :responses])
    params.permit(:voter_id, :election_id, responses: [])
  end

  def update_params
    params.require([:id])
    params.permit(:id, :value, :option)
  end
end
