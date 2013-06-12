module Bcx

  # Bcx::Launchpad
  # Provides access to the authorization resource
  # See: https://github.com/37signals/api/blob/master/sections/authentication.md#get-authorization
  #
  class Launchpad < Rapidash::Client
    extension :json

    raise_errors

    resource :authorization, class_name: "Bcx::Resources::Authorization"

    def initialize(auth_method, options = {})
      self.class.method(auth_method)

      self.class.site("https://launchpad.37signals.com/")

      options[:uid] ||= options[:client_id]
      options[:secret] ||= options[:client_secret]
      options[:site] ||= self.class.site

      super(options)
    end
  end
end