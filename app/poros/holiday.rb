class Holiday
  attr_reader :name, :date
  def initialize(details)
    @name = details[:localName]
    @date = details[:date]
  end
end