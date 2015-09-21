module RemoteLogin
  module AccountControllerPatch
    def self.included(base) # :nodoc:
      base.class_eval do
        unloadable
        skip_before_filter :verify_authenticity_token, only: :remote_login
        before_filter :verify_remote_authenticity_token, only: :remote_login

        def remote_login
          authenticate_user
        rescue AuthSourceException => e
          logger.error "An error occured when authenticating #{params[:username]}: #{e.message}"
          render_error :message => e.message
        end

        private

        def verify_remote_authenticity_token
          uri = URI.parse(request.env['HTTP_REFERER'])
          token = Setting.plugin_remote_login['token']

          Base64.decode64(params['authenticity_token']) == "#{token}-#{uri.host}-#{Date.today}"
        end
      end
    end

  end
end
AccountController.send(:include, RemoteLogin::AccountControllerPatch)
