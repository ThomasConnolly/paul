# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  event      :string
#  time       :string
#  date       :datetime
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
end
