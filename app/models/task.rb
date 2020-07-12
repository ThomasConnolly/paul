# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string           not null
#  description :text
#  deadline    :string           not null
#

class Task < ApplicationRecord
  belongs_to :user
  acts_as_list
end
