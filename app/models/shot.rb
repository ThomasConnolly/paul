# == Schema Information
#
# Table name: shots
#
#  id         :bigint           not null, primary key
#  dob        :date
#  email      :string
#  first_name :string
#  honey      :string
#  last_name  :string
#  phone      :string
#  shot_time  :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Shot < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :honey, absence: true

  after_create :set_shot_time
  after_create :set_status


  
  def set_shot_time
    self.shot_time = case id
    when 1..24
      "9:00 a.m."
    when 25..49
      "9:15 a.m."
    when 50..74
      "9:30 a.m."
    when 75..99
      "9:45 a.m."
    when 100..124
      "10:00 a.m."
    when 125..149
      "10:15 a.m."
    when 150..174
      "10:30 a.m."
    when 175..199
      "10:45 a.m."
    when 200..224
      "11:00 a.m."
    when 225..249
      "11:15 a.m."
    when 250..274
      "11:30 a.m."
    when 275..299
      "11:45 a.m."
    when 300..324
      "12:00 p.m."
    when 325..349
      "12:15 p.m."
    when 350..374
      "12:30 p.m."
    when 375..399
      "12:45 p.m."
    when 400..424
      "1:00 p.m."
    when 425..449
      "1:15 p.m."
    when 450..474
      "1:30 p.m."
    when 475..499
      "1:45 p.m."
    when 500..524
      "2:00 p.m."
    when 525..549
      "2:15 p.m."
    when 550..574
      "2:30 p.m."
    when 575..600
      "2:45 p.m."
    end
    save!
  end

  def set_status
    self.status = "reserved"
  end
end
