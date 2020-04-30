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
class Pathway < ApplicationRecord
  validates_presence_of :link
  validates_presence_of :image
  validates_presence_of :pubdate
end
