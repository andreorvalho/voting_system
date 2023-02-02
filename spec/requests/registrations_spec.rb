require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /create" do
    let(:voter) { create(:voter) }
    let(:election) { create(:election) }

    it 'returns success and creates a registration' do
      post '/registrations', params: { voter_id: voter.id, election_id: election.id }

      expect(response.status).to eq(200)
      expect(Registration.last.voter).to eq(voter)
      expect(Registration.last.election).to eq(election)
    end
  end
end
