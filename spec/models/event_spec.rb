# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  title             :string
#  price             :integer
#  date              :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  ticket_quantity   :integer
#  tickets_sold      :integer
#  tickets_available :integer
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
