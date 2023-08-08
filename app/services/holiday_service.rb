class HolidayService
  def get_holidays
    get_url("api/v3/NextPublicHolidays/US")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://date.nager.at/")
  end
end