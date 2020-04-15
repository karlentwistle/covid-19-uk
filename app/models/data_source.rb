module DataSource
  HOST = 'https://c19pub.azureedge.net'.freeze

  class << self
    def path
      BlobNavigator.latest_blob.name
    end

    def connection
      Faraday.new(url: HOST) do |faraday|
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def to_json
      Rails.cache.fetch('data_source_cache', expires_in: 1.hour) do
        connection.get(path).body
      end
    end

    def utlas_json
      to_json['utlas']
    end
  end
end
