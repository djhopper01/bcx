module Bcx
  class Client < Rapidash::Client
    extension :json

    method :oauth

    raise_errors

    resource :projects, class_name: 'Bcx::Resources::Project'
    resource :todolists, class_name: 'Bcx::Resources::Todolist'
    resource :people, class_name: 'Bcx::Resources::Person'

    def initialize(auth_method, options = {})
      @account = options[:account] || Bcx.configuration.account
      @api_version = Bcx.configuration.api_version

      options[:uid] ||= options[:client_id]
      options[:secret] ||= options[:client_secret]
      options[:site] ||= "https://basecamp.com/#{@account}/api/#{@api_version}/"

      super(options)
    end

  end
end
