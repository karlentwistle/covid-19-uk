module DataSource
  HOST = 'https://c19downloads.azureedge.net'.freeze
  PATH = '/downloads/data/utlas_latest.json'.freeze

  class << self
    def connection
      Faraday.new(url: HOST) do |faraday|
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def to_json
      Rails.cache.fetch('data_source_cache', expires_in: 1.hour) do
        connection.get(PATH).body
      end
    end

    def utlas_json
      to_json.except("metadata")
    end
  end
end
