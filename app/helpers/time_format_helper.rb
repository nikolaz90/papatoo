module TimeFormatHelper
  def formated_day_time_date(date_time)
    date_time.strftime('%a at %H:%M on %d/%m/%Y')
  end
end
