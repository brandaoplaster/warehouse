module Cart
  class Manager
    def initialize(user_or_session)
      @context = user_or_session
    end

    private

    def adapter
      @adapter ||= @context.is_a?(User) ?
      DatabaseCartAdapter.new(@context) :
      SessionAdapter.new(@context)
    end
  end
end
