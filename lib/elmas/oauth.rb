# from https://developers.exactonline.com/#Example retrieve access token.html
module Elmas
  module OAuth
    def authorize(options={})
      # mock logging in with OAUTH
    end
    
    # Return URL for OAuth authorization
    def authorize_url(options={})
      options[:response_type] ||= "code"
      options[:redirect_uri] ||= self.redirect_uri
      params = authorization_params.merge(options)
      connection.build_url("/api/oauth2/auth/", params).to_s
    end

    # Return an access token from authorization
    def get_access_token(code, options={})
      options[:grant_type] ||= "authorization_code"
      options[:redirect_uri] ||= self.redirect_uri
      params = access_token_params.merge(options)
      post("/api/oauth2/access_token/", params.merge(code: code))
    end

    private

    def authorization_params
      {
        client_id: client_id
      }
    end

    def access_token_params
      {
        client_id: client_id,
        client_secret: client_secret
      }
    end
  end
end
