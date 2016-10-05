class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts

  enum role: [:user, :vip, :admin]


  devise :database_authenticatable, :registerable, :rememberable, :validatable

        #   :recoverable, :trackable, :validatable, :confirmable


  after_initialize :set_default_user_role

  def set_default_user_role
    self.role = :user
  end

end
