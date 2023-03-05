# frozen_string_literal: true

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
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  avatar                 :string
#  honey                  :string
#  stripe_id              :string
#  role                   :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username)
#

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  before_save :set_username
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
  after_validation :add_profile
  after_commit :maybe_add_stripe_id, on: %i[create update]
  after_destroy :cancel_stripe_customer
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities, dependent: :destroy
  has_many :story_ideas, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :vnotes, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :avatar, content_type: %i[png jpg]
  has_one :pledge, dependent: :destroy
  has_many :donations, dependent: :destroy


  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true

  enum :role, { member: 0, vestry: 1, communicator: 2 }
  after_initialize :set_default_role, if: :new_record?

  scope :vestry, -> { where(role: 1) }
  scope :communicator, -> { where(role: 2) }

  def set_default_role
    self.role ||= :member
  end

  attr_accessor :login

  def login
    @login || username || email
  end

  # Include default devise modules
  # Others available are:
  # :lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable,
         authentication_keys: [:login]

  def set_username
    self.username = "#{first_name} #{last_name}"
  end

  def formatted_email
    "#{username} <#{email}>".strip
  end

  def maybe_add_stripe_id
    return unless stripe_id.blank?

    customer = Stripe::Customer.create(
      email:
    )
    update(stripe_id: customer.id)
  end

  def cancel_stripe_customer
        Stripe::Customer.delete(self.stripe_id) if self.stripe_id
  end



  def add_profile
    create_profile if profile.nil?
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions.to_h).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end
end
