class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  has_many :photos
  has_many :categories, through: :photos
  has_one :user_profile
  has_many :following_followers, class_name: "Follower", foreign_key: "following_id"
  has_many :followee_followers, class_name: "Follower", foreign_key: "followee_id"


  # has_many :teacher_links, :foreign_key => :student_id, :dependent => :destroy, :class_name => "TeacherStudentLink"
  # has_many :student_links, :foreign_key => :teacher_id, :dependent => :destroy, :class_name => "TeacherStudentLink"
  # has_many :students, :through => :student_links
  # has_many :teachers, :through => :teacher_links

  has_many :comment_walls
  # has_many :user_profile_comment_walls, through: :comment_walls, source: :user_profile
end
