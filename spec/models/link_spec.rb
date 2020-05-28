# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  event      :string
#  time       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Link, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
