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
#  full_name              :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  role                   :string(255)
#

class User < ActiveRecord::Base

  ROLES = %i[admin editor member]
  before_save :set_full_name
  
  has_many :posts
  has_many :comments, :through => :posts
  has_many :books
  has_many :sermons
  has_one  :profile
  has_many :opportunities
  
  has_attached_file :avatar, 
                    :styles => { :medium => "400x400>", :thumb => "120x120>" }, 
                    :default_url => '/images/:style/missing.png',
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"] }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:full_name]
  end

  private

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
end
  ROLES = %i[admin editor member]
  
