# == Schema Information
#
# Table name: shots
#
#  id         :integer          not null, primary key
#  last_name  :string
#  first_name :string
#  dob        :date
#  email      :string
#  phone      :string
#  shot_time  :string
#  status     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Shot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
