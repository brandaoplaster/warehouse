module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :authorize_role!

    class_attribute :required_roles, default: []
  end

  class_methods do
    def require_role(*roles)
      self.required_roles = roles.flatten.map(&:to_sym)
    end
  end

  private

  def authorize_role!
    return if self.class.required_roles.empty?

    unless current_user_has_required_role?
      handle_unauthorized_access
    end
  end

  def current_user_has_required_role?
    self.class.required_roles.any? do |role|
      current_user.role.to_sym == role
    end
  end

  def handle_unauthorized_access
    redirect_to root_path, alert: "You do not have permission to access this page."
  end
end
