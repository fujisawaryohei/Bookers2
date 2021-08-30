module SessionsHelper
  def signed_in_user?(user)
    current_user == user
  end
end
