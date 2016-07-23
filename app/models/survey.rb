class Survey < ActiveRecord::Base
  has_many :vote_options, dependent: :allow_destroy
  validates :name, presence: true
  accepts_nested_attributes_for :vote_options, reject_if: :all_blank, allow_destroy: true

def questions_for_form
  collection = vote_option.where(survey_id: id)
  collection.any? ? collection : vote_options.build
  end
end
