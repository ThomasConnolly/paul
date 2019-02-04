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
#  username              :string(255)
#  customer_id            :string
#  card                   :string
#  avatar                 :string
#  honey                  :string
#  source                 :string
#  stripe_sponsorship_id  :string
#  card_last4             :string
#  card_exp_year          :integer
#  card_exp_month         :integer
#  card_type              :string
#  donation_id            :integer
#  subscription_id        :string
#

class User < ApplicationRecord
  extend Rolify
  rolify

  before_save :set_username
  after_create :assign_default_role
  after_create :add_profile
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :books
  has_many :definitions
  has_many :story_ideas, dependent: :destroy
  has_one :pledge, dependent: :destroy
  has_many :vreports, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_attachment :avatar, accept: [:png, :jpg, :gif]
  has_one :albergue_donation, dependent: :destroy
  #honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true

  attr_accessor :login

   #Include default devise modules
   #Others available are:
   #:lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :authentication_keys => [:login]


  def self.assign_from_row(row)
    user = find_by_username(row["first_name" + "last_name"]) || new
      user.assign_attributes row.to_hash.slice(:last_name, :first_name, :email,
        :member_id)
      user  # =====see member.rb for example ======
  end


  def set_username
    self.username = "#{self.first_name.downcase.titleize} #{self.last_name.downcase.titleize}".strip
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def add_profile
    self.create_profile if profile.nil?
  end
  #This code is for retrieving Stripe.customer for current_user
  def stripe_customer
    if self.stripe_customer_id? && self.stripe_pledge? || self.stripe_customer_id? && self.albergue_sponsor?
      return Stripe::Customer.retrieve(stripe_customer_id)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_customer_id: stripe_customer.id)
      stripe_customer
    end
  end



    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value",
        { :value => login.downcase }]).first
      else
      if conditions[:username].nil?
      where(conditions).first
      else
      where(username: conditions[:username]).first
      end
      end
    end
end
