# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar                 :string
#  card_brand             :string
#  card_exp_month         :string
#  card_exp_year          :string
#  card_last4             :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  honey                  :string
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  username               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username)
#

class User < ApplicationRecord
  extend Rolify
  rolify

  validates :first_name, presence: true
  validates :last_name, presence: true
  before_save :set_username
  validates :email, presence: true
  after_create :assign_default_role
  after_create :add_profile
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :story_ideas, dependent: :destroy
  has_many :tasks
  has_many :vreports
  validates_confirmation_of :password
  has_one_attached :avatar, dependent: :destroy
  has_many_attached :photos
  validates :avatar, content_type: [:png, :jpg,]
  has_one :pledge, dependent: :destroy
  has_many :donations, dependent: :destroy
  
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true

  attr_accessor :login

  def login
    @login || self.username || self.email
  end

  # Include default devise modules
  # Others available are:
  #:lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         authentication_keys: [:login]

  def self.assign_from_row(row)
    user = find_by_username(row['first_name' + 'last_name']) || new
    user.assign_attributes row.to_hash.slice(:last_name, :first_name, :email,
                                             :member_id)
    user # =====see member.rb for example ======
  end

  def set_username
    self.username = "#{self.first_name} #{self.last_name}"
  end

  def formatted_email
    "#{self.username} <#{self.email}>".strip
  end

  def assign_default_role
    add_role(:member)
  end


  def add_profile
    create_profile if profile.nil?
  end

  # This code is for retrieving Stripe.customer for current_user
  # def stripe_customer
  #   if stripe_id? && stripe_pledge? || stripe_id? && albergue_sponsor?
  #     Stripe::Customer.retrieve(stripe_id)
  #   else
  #     stripe_customer = Stripe::Customer.create(email: email)
  #     update(stripe_id: stripe_customer.id)
  #     stripe_customer
  #   end
  # end

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions.to_h).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase }]).first
  end
end
