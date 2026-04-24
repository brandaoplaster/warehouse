module Store
  class ApplicationController < ::ApplicationController
    include Authenticable
    require_role :client

    layout "store"
  end
end
