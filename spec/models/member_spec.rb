# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  anniversary   :date
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  full_name     :string
#

require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
