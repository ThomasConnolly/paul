# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
    belongs_to :survey
    has_many :answers, dependent: :destroy
    accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

end
