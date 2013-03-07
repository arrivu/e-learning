module CASHelper

	class CASAPI

    class LoginResponse
      attr_accessor :type, :tgt, :msg

      def initialize(params)
        attrs = %w(type tgt)
        attrs.each { |attr| self.instance_variable_set("@#{attr}", params[attr]) }
        message = params["message"]
        @msg = message["untranslated_path"]
      end
    end

		def self.login(username, password)
			response_bytes =  RestClient::Request.execute(:method => :post, :url => login_url,
                                                    :payload => {:username => username, :password => password} )
			response_json =JSON.parse(response_bytes)
			#puts response_json
			LoginResponse.new(response_json)
		end

		def self.logout(tgt)
			response_bytes =  RestClient.delete(logout_url, {:cookies => {:tgt => "#{tgt}"}})
			json = JSON.parse(response_bytes)
			#puts json
			message = json["message"]
			message["untranslated_path"]
    end

    private
        def self.login_url
          "#{Setting.cas.url}#{Setting.cas.login_path}"
        end

        def self.logout_url
          "#{Setting.cas.url}#{Setting.cas.logout_path}"
        end
  end
end