# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  answer_options :text
#  comment        :text
#  question_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  belongs_to :participant
  validates :answer_option, presence: true
end
