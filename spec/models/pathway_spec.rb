# frozen_string_literal: true

# == Schema Information
#
# Table name: pathways
#
#  id         :integer          not null, primary key
#  image      :string
#  pubdate    :date
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Pathway, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
