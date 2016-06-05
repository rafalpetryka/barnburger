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
          if @opening_hours.send(day)[0] == 'nieczynne'
            return_html += t("short_days.#{day.to_s.first(3)}") + ': ' + t('contact.closed') + '<br>'
          else
            return_html += t("short_days.#{day.to_s.first(3)}") + ": #{hours(day, 0)}<sup>#{minutes(day, 0)}</sup>-#{hours(day, 1)}<sup>#{minutes(day, 1)}</sup> <span>(" + t('contact.zlota.opening_hours.order_up_to') + " #{hours(day,2)}:#{minutes(day,2)})</span><br>"
          end
        else
          if @opening_hours.send(day)[0] == 'nieczynne'
            return_html += t("short_days.#{first_day.to_s.first(3)}") + "-" + t("short_days.#{day.to_s.first(3)}") + ": " + t('contact.closed') + "<br>"
          else
            return_html += t("short_days.#{first_day.to_s.first(3)}") + "-" + t("short_days.#{day.to_s.first(3)}") + ": #{hours(day, 0)}<sup>#{minutes(day, 0)}</sup>-#{hours(day, 1)}<sup>#{minutes(day, 1)}</sup> <span>(" + t('contact.zlota.opening_hours.order_up_to') + " #{hours(day, 2)}:#{minutes(day, 2)})</span><br>"
          end
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
