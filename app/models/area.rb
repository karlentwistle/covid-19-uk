class Area
  def self.from_json(json)
    json.map do |code, data|
      name = data['name']['value']
      cumulative_counts = data['dailyTotalConfirmedCases']
      daily_counts = data['dailyConfirmedCases']

      Area.new(code, name, cumulative_counts, daily_counts)
    end
  end

  def initialize(code, name, cumulative_counts, daily_counts)
    @code = code
    @name = name
    @cumulative_counts = format_counts(cumulative_counts)
    @daily_counts = format_counts(daily_counts)
  end

  def name
    ALIASES.fetch(@name, @name)
  end

  attr_reader :daily_counts, :cumulative_counts, :code

  def rolling_average_daily_counts
    @rolling_average_daily_counts ||= calculate_rolling_average_daily_counts
  end

  private

  ALIASES = {
    'Bristol, City of' => 'Bristol',
    'Kingston upon Hull, City of' => 'Kingston upon Hull'
  }.freeze

  def calculate_rolling_average_daily_counts
    daily_counts.keys.map do |date|
      sample_start = date - 2.days
      sample_end = date
      range = sample_start..sample_end

      sample = daily_counts.select { |date_key| date_key.in?(range) }
      average_count = sample.values.sum / sample.size

      [date, average_count]
    end.to_h
  end

  def format_counts(counts)
    counts.map do |count|
      [Date.parse(count['date']), count['value']]
    end.to_h
  end
end
