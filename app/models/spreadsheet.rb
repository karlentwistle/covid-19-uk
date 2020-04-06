class Spreadsheet
  def self.covid_19
    @covid_19 ||= new(path: 'https://fingertips.phe.org.uk/documents/Historic%20COVID-19%20Dashboard%20Data.xlsx')
  end

  def initialize(path:)
    @path = path
  end

  def open
    Roo::Spreadsheet.open(path)
  end

  def utlas
    Rails.cache.fetch('utlas_cache', expires_in: 1.hour) do
      open
        .sheet('UTLAs')
        .select { |row| /E\d{8}/.match?(row[0].to_s) }
    end
  end

  attr_reader :path
end
