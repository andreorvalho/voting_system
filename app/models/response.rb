class ValidatesOptionIsFromBallot < ActiveModel::Validator
  def validate(record)
    if record&.option && record.option&.ballot_id != record&.ballot_id
      record.errors.add :option, "ballot id is not the same as the record's ballot id"
    end
  end
end

class ValidatesOptionIsSetIfBallotHasOptions < ActiveModel::Validator
  def validate(record)
    if record&.ballot&.options&.any? && !record&.option&.present?
      record.errors.add :option, "is not set and ballot has options"
    end
  end
end

class ValidatesValueIsNotSetIfBallotHasOptions < ActiveModel::Validator
  def validate(record)
    if record&.ballot&.options&.any? && record&.value&.present?
      record.errors.add :value, "is set but ballot has options, need to chose an option"
    end
  end
end

class ValidatesValueIsSetIfBallotHasNoOptions < ActiveModel::Validator
  def validate(record)
    if record&.ballot&.options&.empty? && !record&.value&.present?
      record.errors.add :value, "needs to be set when ballot has no options"
    end
  end
end

class Response < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :ballot
  belongs_to :option, optional: true
  belongs_to :voter

  validates_with ValidatesOptionIsFromBallot
  validates_with ValidatesOptionIsSetIfBallotHasOptions
  validates_with ValidatesValueIsNotSetIfBallotHasOptions
  validates_with ValidatesValueIsSetIfBallotHasNoOptions
end
