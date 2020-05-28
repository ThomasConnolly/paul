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
class Link < ApplicationRecord
end
