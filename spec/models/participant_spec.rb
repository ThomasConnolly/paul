# == Schema Information
#
# Table name: participants
#
#  id                    :bigint           not null, primary key
#  first_preferred_day   :string
#  first_preferred_time  :string
#  second_preferred_day  :string
#  second_preferred_time :string
#  session               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
require 'rails_helper'

RSpec.describe Participant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
