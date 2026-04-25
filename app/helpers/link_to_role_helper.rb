module LinkToRoleHelper
  def dashboard_path_for(user)
   if user.admin?
     backoffice_root_path
   elsif user.client?
     account_root_path
   else
    root_path
   end
  end
end
