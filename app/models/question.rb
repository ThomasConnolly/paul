# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :string
#  survey_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :survey, dependent: :destroy
  validates :content, presence: true
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

  def answers_for_form
    collection = answers.where(survey_id: id)
    collection.any? ? collection : answers.build
  end
end
