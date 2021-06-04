# == Schema Information
#
# Table name: todo_items
#
#  id           :bigint           not null, primary key
#  completed    :boolean
#  completed_at :datetime
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  todo_list_id :bigint           not null
#
# Indexes
#
#  index_todo_items_on_todo_list_id  (todo_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (todo_list_id => todo_lists.id)
#
class TodoItem < ApplicationRecord
  belongs_to :todo_list
end
