class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  # NOTE: Only admin can update/destroy users
  enum role: [:user, :vip, :admin]

  # Handles setting default role to :user. Maybe there's a cleaner, simpler solution?
  after_initialize :set_default_role

  private

  def set_default_role
    self.role ||= :user
  end
end
