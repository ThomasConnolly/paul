# == Schema Information
#
# Table name: formation_talks
#
#  id           :integer          not null, primary key
#  title        :string
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  delivered_on :date
#

class FormationTalk < ApplicationRecord
  
  default_scope -> { order('delivered_on ASC') }
  validates_presence_of :title
end
