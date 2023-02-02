require 'rails_helper'

RSpec.describe Response, type: :model do
  describe "when there are 2 ballots" do
    let(:election) { create(:election, :normal) }
    let(:ballot) { election.ballots.first }

    let(:other_ballot) { create(:ballot, :normal, election: election) }
    let(:option) { create(:option, ballot: other_ballot) }

    it 'returns error when the given option is not from ballot' do
      response = Response.new(option: option, ballot: ballot, voter: create(:voter))
      expect { response.save! }
        .to raise_error(ActiveRecord::RecordInvalid)
        .with_message("Validation failed: Option ballot id is not the same as the record's ballot id")
    end
  end

  describe "response has no option set and ballot has options" do
    let(:election) { create(:election, :normal) }
    let(:ballot) { election.ballots.first }

    it 'returns error' do
      response = Response.new(ballot: ballot, voter: create(:voter))
      expect { response.save! }
        .to raise_error(ActiveRecord::RecordInvalid)
        .with_message("Validation failed: Option is not set and ballot has options")
    end
  end

  describe "response does not have a value and ballot has no options" do
    let(:election) { create(:election, :ballot_with_no_options) }
    let(:ballot) { election.ballots.first }

    it 'returns error' do
      response = Response.new(ballot: ballot, voter: create(:voter))
      expect { response.save! }
        .to raise_error(ActiveRecord::RecordInvalid)
        .with_message("Validation failed: Value needs to be set when ballot has no options")
    end
  end

  describe "response has a value and ballot has options" do
    let(:election) { create(:election, :normal) }
    let(:ballot) { election.ballots.first }

    it 'returns error' do
      response = Response.new(ballot: ballot, voter: create(:voter), value: "value", option: ballot.options.first)
      expect { response.save! }
        .to raise_error(ActiveRecord::RecordInvalid)
        .with_message("Validation failed: Value is set but ballot has options, need to chose an option")
    end
  end
end
