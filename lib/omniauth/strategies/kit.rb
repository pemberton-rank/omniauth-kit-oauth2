require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Kit < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "kit"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://www.kitcrm.com/"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ access_token['user_id'] }

      info do
        {
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :email => raw_info['email'],
          :myshopify_domain => raw_info['myshopify_domain'],
          :id => raw_info['id']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/me').parsed
      end

      def callback_url
        options[:callback_url] || full_host + script_name + callback_path
      end
    end
  end
end
