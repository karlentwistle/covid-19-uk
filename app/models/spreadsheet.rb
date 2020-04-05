module Spreadsheet
  def self.covid_19
    Roo::Spreadsheet.open('https://fingertips.phe.org.uk/documents/Historic%20COVID-19%20Dashboard%20Data.xlsx')
  end
end
