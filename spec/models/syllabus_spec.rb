# == Schema Information
#
# Table name: syllabuses
#
#  id         :integer          not null, primary key
#  year       :string
#  grade      :string
#  title1     :string
#  title2     :string
#  title3     :string
#  title4     :string
#  title5     :string
#  title6     :string
#  title7     :string
#  title8     :string
#  title9     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  theme      :string
#  quarter    :integer
#

require 'rails_helper'

RSpec.describe Syllabus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
