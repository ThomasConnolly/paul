class User < ActiveRecord::Base
  before_save :set_full_name

  enum role: [:admin, :editor, :member, :guest]
  after_initialize :set_default_role, :if => :new_record?
  
  has_attachment :avatar, accept:[:jpg, :png, :gif]
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :sermons
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :books
  has_one :pledge
  after_create :add_profile
  belongs_to :role
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
    self.create_profile
  end

  # def send_welcome_email
  #  WelcomeMailer.welcome_email(self).deliver
  # end

end
