module Account
  class ApplicationController < ::ApplicationController
    include Authenticable
    require_role :client

    layout "dashboard"
  end
end
