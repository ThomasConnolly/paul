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

class FormationTalk < ActiveRecord::Base
  
  default_scope -> { order('created_at DESC') }
  validates_presence_of :title
end
