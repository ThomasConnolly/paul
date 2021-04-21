# == Schema Information
#
# Table name: shots
#
#  id         :bigint           not null, primary key
#  dob        :date
#  email      :string
#  first_name :string
#  honey      :string
#  last_name  :string
#  phone      :string
#  shot_time  :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Shot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
