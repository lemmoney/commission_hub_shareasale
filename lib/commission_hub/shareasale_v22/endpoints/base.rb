require 'digest'

module CommissionHub
  module ShareasaleV22
    module Endpoints
      class Base < CommissionHub::Endpoint

        def call(request_params={})
          request_params =
            { headers: {
                "x-ShareASale-Authentication" => signature,
                "x-ShareASale-Date"           => timestamp
              },
              query: {
                "version"     => api_version,
                "action"      => action,
                "affiliateId" => affiliate_id,
                "token"       => api_token
              }
            }.merge(request_params)
          connection.class.get(full_uri, request_params)
        end

        def api_version
          "2.2"
        end

        def api_token
          connection.settings.api_token
        end

        def api_secret
          connection.settings.api_secret
        end

        def timestamp
          (connection.settings.current_date || Time.now).utc.rfc2822
        end

        def action
          connection.settings.action
        end

        def affiliate_id
          connection.settings.affiliate_id
        end

        def signature
          Digest::SHA256
            .hexdigest("#{api_token}:#{timestamp}:#{action}:#{api_secret}")
        end

      end
    end
  end
end
