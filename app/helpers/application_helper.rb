module ApplicationHelper
  def password_reset_page?
    controller_name == 'passwords' && (action_name == 'new' || action_name == 'create')
  end
end
