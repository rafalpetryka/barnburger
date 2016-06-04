module OpeningHoursHelper
  def opening_hours(place)
    @opening_hours = OpeningHour.find_by(place: place)
    days = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    return_html = ''
    first_day = nil
    days.each_with_index do |day, index|
      if (index + 1) != days.length and @opening_hours.send(day) == @opening_hours.send(days[index + 1])
        first_day = day if first_day.nil?
      else
        if first_day.nil?
          return_html += I18n.t("short_days.#{day.to_s.first(3)}") + ": #{hours(day, 0)}<sup>#{minutes(day, 0)}</sup>-#{hours(day, 1)}<sup>#{minutes(day, 1)}</sup> <span>" + I18n.t('contact.zlota.opening_hours.order_up_to') + " #{hours(day,2)}:#{minutes(day,2)})</span><br>"
        else
          return_html += I18n.t("short_days.#{first_day.to_s.first(3)}") + "-" + t("short_days.#{day.to_s.first(3)}") + ": #{hours(day, 0)}<sup>#{minutes(day, 0)}</sup>-#{hours(day, 1)}<sup>#{minutes(day, 1)}</sup> <span>" + I18n.t('contact.zlota.opening_hours.order_up_to') + " #{hours(day, 2)}:#{minutes(day, 2)})</span><br>"
          first_day = nil
        end
      end
    end
    return_html
  end
  def hours(day, part)
    @opening_hours.send(day)[part].first(2)
  end
  def minutes(day, part)
    @opening_hours.send(day)[part].last(2)
  end
end
