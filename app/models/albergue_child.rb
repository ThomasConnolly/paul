# == Schema Information
#
# Table name: albergue_children
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  birthday   :date
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AlbergueChild < ApplicationRecord
  has_one_attached :avatar
end
