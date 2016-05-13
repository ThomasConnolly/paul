# == Schema Information
#
# Table name: anniversaries
#
#  id          :integer          not null, primary key
#  salutation  :string
#  last_name   :string
#  anniversary :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Anniversary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
