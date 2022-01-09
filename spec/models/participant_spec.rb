# == Schema Information
#
# Table name: participants
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  email                 :string
#  honey                 :string
#  session               :string
#  first_preferred_day   :string
#  first_preferred_time  :string
#  second_preferred_day  :string
#  second_preferred_time :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe Participant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
