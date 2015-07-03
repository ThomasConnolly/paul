class User < ActiveRecord::Base

  before_save :set_full_name
  enum role: [ :admin, :editor, :member ]

  has_attachment :avatar, accept: [:jpg, :jpeg, :png, :gif]
  has_many :posts, dependent: :destroy
  has_many :comments, :through => :posts
  has_many :books
  has_many :sermons
  has_one  :profile, dependent: :destroy
  has_many :opportunities
  has_many :pledges

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:full_name]


  
  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end  

end



