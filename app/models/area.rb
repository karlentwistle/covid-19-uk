class Area
  def self.from_utlas(utlas)
    utlas.to_a.map { |utla| Area.new(*utla) }
  end

  def initialize(code, name, *cumulative_counts)
    @code = code
    @name = name
    @cumulative_counts = cumulative_counts
  end

  def name
    ALIASES.fetch(@name, @name)
  end

  def daily_cumulative_counts
    @daily_cumulative_counts ||= calculate_daily_cumulative_counts
  end

  def daily_counts
    @daily_counts ||= calculate_daily_counts
  end

  def average_cumulative_counts
    @average_cumulative_counts ||= calculate_average_cumulative_counts
  end

  attr_reader :code

  private

  START_DATE = Date.new(2020, 3, 9).freeze
  ALIASES = {
    'Bristol, City of' => 'Bristol'
  }.freeze

  def calculate_daily_cumulative_counts
    cumulative_counts.map.with_index do |cumulative_count, days_from_now|
      date = START_DATE + days_from_now.day

      [date, cumulative_count]
    end.to_h
  end

  def calculate_daily_counts
    daily_cumulative_counts.map do |date, cumulative_count|
      yesturday_cumulative_count = daily_cumulative_counts.fetch(date.yesterday, 0)
      daily_count = cumulative_count - yesturday_cumulative_count
      normalized_daily_count = [0, daily_count].max

      [date, normalized_daily_count]
    end.to_h
  end

  def calculate_average_cumulative_counts
    daily_counts
      .to_a
      .in_groups_of(3)
      .inject(Hash.new) do |hash, group|
        return hash if group.any?(nil)

        hash[group.to_h.keys.last] = group.to_h.values.sum / 3
        hash
      end
  end

  attr_reader :cumulative_counts
end
