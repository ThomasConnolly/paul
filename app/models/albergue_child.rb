# == Schema Information
#
# Table name: albergue_children
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AlbergueChild < ApplicationRecord
  has_one_attached :avatar
end
