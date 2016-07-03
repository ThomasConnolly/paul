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
     has_many :questions, :dependent => :destroy
     accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

end