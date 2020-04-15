module BlobNavigator
  class << self
    def client
      Azure::Storage::Blob::BlobService.create(storage_blob_host: 'https://publicdashacc.blob.core.windows.net')
    end

    def blobs
      client.list_blobs('publicdata')
    end

    def data_blobs
      blobs
        .select { |b| b.name.starts_with?('data') }
        .select { |b| b.properties[:lease_status] == 'unlocked' }
        .select { |b| b.properties[:lease_state] == 'available' }
    end

    def latest_blob
      data_blobs.max do |blob_a, blob_b|
        blob_a_last_modified = DateTime.parse(blob_a.properties[:last_modified])
        blob_b_last_modified = DateTime.parse(blob_b.properties[:last_modified])

        blob_a_last_modified <=> blob_b_last_modified
      end
    end
  end
end
