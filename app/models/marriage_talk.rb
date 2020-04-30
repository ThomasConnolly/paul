# frozen_string_literal: true

# == Schema Information
#
# Table name: marriage_talks
#
#  id           :bigint           not null, primary key
#  body         :text
#  delivered_on :date
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MarriageTalk < ApplicationRecord
end
