class User < ActiveRecord::Base
  before_save :set_full_name

  enum role: [:admin, :editor, :member, :guest]
  after_initialize :set_default_role, :if => :new_record?
  
  #  has_attachment :avatar, accept:[:jpg, :png, :gif]
  has_many :posts, dependent: :destroy
  has_many :comments, :through => :posts
  has_many :sermons
  has_one  :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :opportunities
  has_many :books
  has_one :pledge
  after_create :build_profile
  belongs_to :role

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

  def build_profile
    Profile.create("user_id" => id)
  end
end
