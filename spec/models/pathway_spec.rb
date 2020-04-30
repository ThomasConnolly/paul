# == Schema Information
#
# Table name: pathways
#
#  id         :bigint           not null, primary key
#  image      :string
#  link       :string
#  pubdate    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Pathway, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
