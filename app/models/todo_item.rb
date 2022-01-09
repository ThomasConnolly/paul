# == Schema Information
#
# Table name: todo_items
#
#  id           :integer          not null, primary key
#  description  :text
#  completed    :boolean
#  completed_at :datetime
#  todo_list_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_todo_items_on_todo_list_id  (todo_list_id)
#

class TodoItem < ApplicationRecord
  belongs_to :todo_list
end
