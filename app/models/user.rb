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
#  member_id              :integer
#  communicator           :boolean
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

class User < ActiveRecord::Base
  
  before_save :set_full_name
  enum role: { admin: 0, vestry: 1, editor: 2, member: 3, guest: 4 }
  after_initialize :set_default_role, :if => :new_record?
  after_create :add_profile
  has_attachment :avatar, accept:[:jpg, :png, :gif]
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :books
  has_many :story_ideas, dependent: :destroy
  has_one :pledge, dependent: :destroy
  has_many :vreports, dependent: :destroy
  validates :full_name, uniqueness: { case_sensitive: false }
  #after_create :send_welcome_email
   attr_accessor :login

   #Include default devise modules 
   #Others available are:
   #:lockable, :confirmable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :invitable,
         :authentication_keys => [:login]


  def self.assign_from_row(row)
    user = find_by_full_name(row["first_name" + "last_name"]) || new  
      user.assign_attributes row.to_hash.slice(:last_name, :first_name, :email, 
        :member_id)
      user  # =====see member.rb for example ======
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

  #def send_welcome_email
   # WelcomeMailer.welcome_email(self).deliver_now
  #end


  #def facebook
  #  self.connections.where(provider: "facebook").first
  #end

    def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(full_name) = :value OR lower(email) = :value",
     { :value => login.downcase }]).first
  else
    if conditions[:full_name].nil?
      where(conditions).first
    else
      where(full_name: conditions[:full_name]).first
    end
  end
end
end
