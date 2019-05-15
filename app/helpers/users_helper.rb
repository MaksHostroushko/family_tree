module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def logged_in_user
   unless logged_in?
     flash[:danger] = "Please log in."
     redirect_to root_path
   end
 end
end
