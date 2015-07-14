class User < ActiveRecord::Base

  before_save :set_full_name
  
  enum role: [ :admin, :editor, :member, :guest ]
  after_initialize :set_default_role, :if => :new_record?


  

  
  has_many :posts, dependent: :destroy
  has_many :comments, :through => :posts
  has_many :books
  has_many :sermons
  has_one  :profile, dependent: :destroy
  has_many :opportunities
  has_one :pledge
  belongs_to :role
  after_create :add_profile



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:full_name]


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
    self.profile = Profile.create
  end
end



