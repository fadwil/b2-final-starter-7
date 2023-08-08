class HolidayFacade
  def service
    HolidayService.new
  end

  def next_three_holidays
    details = service.get_holidays.slice(0,3)
    details.map do |holiday|
      Holiday.new(holiday)
    end
  end
end