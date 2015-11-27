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

class User < ActiveRecord::Base
  before_save :set_full_name

  enum role: [:admin, :vestry, :editor, :member, :guest]
  after_initialize :set_default_role, :if => :new_record?
  
  has_attachment :avatar, accept:[:jpg, :png, :gif]
  has_many :posts, dependent: :destroy
  has_many :comments, through: :commentable
  has_many :sermons
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :books
  has_one :pledge
  after_create :add_profile
  has_one :role
  has_many :vreports
  # after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, 
         :authentication_keys => [:full_name]

 

  def email_required?
    false
  end

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end  

  def set_default_role
    self.role ||= :member
  end

  def add_profile
    self.create_profile if profile.nil?
  end

  # def send_welcome_email
  #  WelcomeMailer.welcome_email(self).deliver
  # end

end
