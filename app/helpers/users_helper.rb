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

  def image_present
    if @user.image.present?
      link_to (image_tag @user.image.url(:small) ), user_path(@user)
    else
      link_to (image_tag 'empty.png', width: 152 ), user_path(@user)
    end
  end
end
