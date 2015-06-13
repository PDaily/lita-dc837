module Lita
  module Handlers
    class Animate < Handler
      URL = "https://ajax.googleapis.com/ajax/services/search/images"
      VALID_SAFE_VALUES = %w(active moderate off)

      config :safe_search, types: [String, Symbol], default: :active do
        validate do |value|
          unless VALID_SAFE_VALUES.include?(value.to_s.strip)
            "valid values are :active, :moderate, or :off"
          end
        end
      end

      route(/(?:animate|gif|anim)(?:\s+me)? (.+)/i, :fetch, command: true, help: {
        "animate QUERY" => "animate everything"
      })

      def fetch(response)
        query = response.matches[0][0]

        http_response = http.get(
          URL,
          v: "1.0",
          q: query,
          safe: config.safe_search,
          rsz: 8,
          imgtype: "animated"
        )

        data = MultiJson.load(http_response.body)

        if data["responseStatus"] == 200
          choice = data["responseData"]["results"].sample
          response.reply "#{choice["unescapedUrl"]}"
        else
          reason = data["responseDetails"] || "unknown error"
          Lita.logger.warn(
            "Couldn't get image from Google: #{reason}"
          )
        end
      end

      private

      def safe_value
        safe = Lita.config.handlers.animate.safe_search || "active"
        safe = safe.to_s.downcase
        safe = "active" unless ["active", "moderate", "off"].include?(safe)
        safe
      end
    end

    Lita.register_handler(Animate)
  end
end