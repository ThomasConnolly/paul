# frozen_string_literal: true

# == Schema Information
#
# Table name: todo_lists
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TodoList < ApplicationRecord
end
