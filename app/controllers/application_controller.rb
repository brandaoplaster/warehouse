class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    case resource.role.to_sym
    when :admin
      backoffice_root_path
    when :client
      account_root_path
    else
      root_path
    end
  end
end
