# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  full_name              :string(255)
#  role                   :integer
#  stripe_customer_id     :string
#

require "spec_helper"

RSpec.describe User, :type => :model do
  it "orders by last name" do
    lindeman = User.create(first_name: "Andy", last_name: "Lindeman")
    chelimsky = User.create(first_name: "David", last_name: "Chelimsky")
    
    expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
  end
end
