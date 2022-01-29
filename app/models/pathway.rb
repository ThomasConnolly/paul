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

class Pathway < ApplicationRecord
  validates_presence_of :link
  validates_presence_of :image
  validates_presence_of :pubdate
end
