require 'rails_helper'

RSpec.describe "Responses", type: :request do
  describe "POST /responses" do
    let(:election) { create(:election, :multiple_ballots) }
    let(:voter) { create(:voter) }

    let(:request) {
      {
        voter_id: voter.id,
        election_id: election.id,
        responses: [
          election.ballots.first.options.first.value,
          election.ballots.second.options.first.value,
          "answer"
        ]
      }
    }

    it 'returns success and creates the responses' do
      post '/responses', params: { voter_id: request[:voter_id], election_id: request[:election_id], responses: request[:responses] }

      expect(response.status).to eq(200)
      expect(Response.all.size).to eq(request[:responses].size)
    end

    it 'returns error when no required params are given' do
      expect {
        post '/responses'
      }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "PUT /responses" do
    let(:election) { create(:election, :ballot_with_no_options) }
    let(:response_object) { create(:response, ballot: election.ballots.first, voter: create(:voter), value: 'value') }

    let(:request) {
      {
        response_id: response_object.id,
        value: 'new_value'
      }
    }

    it 'returns success and creates the responses' do
      put "/responses/#{response_object.id}", params: request

      expect(response.status).to eq(200)
      expect(Response.first.value).to eq(request[:value])
    end
  end
end
