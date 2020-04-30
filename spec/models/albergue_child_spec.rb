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
require 'rails_helper'

RSpec.describe AlbergueChild, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
