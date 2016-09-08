class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :vip, :admin]

  after_initialize :set_role_to_user, if: :new_record?

  def set_role_to_user
    self.role = "user"
  end
end
