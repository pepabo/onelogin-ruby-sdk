require 'onelogin/api/default_api'

module OneLogin
  class Api
    def initialize(client_id, client_secret, client = ApiClient.default)
      @client = DefaultApi.new(client)
      @access_token = generate_token(client_id, client_secret).access_token
    end

    def generate_token(client_id, client_secret)
      auth = "client_id:#{client_id}, client_secret:#{client_secret}"
      generate_token_request = OneLogin::GenerateTokenRequest.new
      generate_token_request.grant_type = 'client_credentials'
      @client.generate_token(auth, generate_token_request)
    end

    def authorazation
      "bearer #{@access_token}"
    end

    DefaultApi.public_instance_methods(false)
              .reject { |m| m =~ /api_client|generate_token|list_|_with_http_info/ }
              .each do |name|
      define_method(name) do |*args|
        @client.send(name, authorazation, *args)
      end
    end

    DefaultApi.public_instance_methods(false)
              .select { |m| m =~ /list_/ }
              .reject { |m| m =~ /_with_http_info/ }
              .each do |name|
      define_method(name) do |opts = {}|
        result = []
        cursor = ""
        loop do
          data, status, header = @client.send("#{name}_with_http_info", authorazation, opts.merge(cursor: cursor))
          result += data

          cursor = header['after-cursor']
          break if status != 200 || cursor.nil?
        end

        result
      end
    end
  end
end
