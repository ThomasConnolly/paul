# == Schema Information
#
# Table name: thankfuls
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Thankful < ApplicationRecord
end
