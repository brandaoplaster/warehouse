module Backoffice
  class ApplicationController < ::ApplicationController
    include Authenticable

    layout "backoffice"
  end
end
