require 'rails_helper'

RSpec.describe "Elections", type: :request do
  describe "POST /elections" do
    let(:name) { 'primer-minister-election' }
    let(:ballots) {
      [
        {
          "name": "Best Ice Cream flavour",
          "type": "multiple-choice",
          "options": [
            "Vanilla",
            "Chocolate",
            "Strawberry",
            "Cookie Dough"
          ]
        },
        {
          "name": "Tastiest Breakfast",
          "type": "single-choice",
          "options": [
            "Toast",
            "Pancakes",
            "Sandwich",
            "Cereal"
          ]
        },
        {
          "name": "Favourite Style of Food",
          "type": "write-in",
          "options": [ ]
        }
      ]
    }

    it 'returns success and adds elections and ballots' do
      post '/elections', params: { name: name, ballots: ballots }

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['name']).to eq(name)
      expect(Election.last.name).to eq(name)
      expect(Ballot.all.size).to eq(ballots.size)
    end

    it 'returns error when no required params are given' do
      expect {
        post '/elections'
      }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
