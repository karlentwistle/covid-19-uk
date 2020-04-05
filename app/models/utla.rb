module Utla
  def self.from_spreadsheet(spreadsheet)
    Rails.cache.fetch('utlas_cache', expires_in: 1.hour) do
      spreadsheet
        .sheet('UTLAs')
        .select { |row| /E\d{8}/.match?(row[0].to_s) }
    end
  end
end
