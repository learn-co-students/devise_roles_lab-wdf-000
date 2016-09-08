class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def has_any_of_roles(args)
    args.include?(current_user.role)
  end

  def has_all_of_roles(args)
    args.all? {|role| current_user.try(role)}
  end
end
