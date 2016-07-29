# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  validates :name, presence: true
  has_many :answers, through: :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  def questions_for_form
    collection = questions.where(survey_id: id)
    collection.any? ? collection : questions.build
  end
end
