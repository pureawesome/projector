module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice  then "success"
      when :alert   then "warning"
    end
  end

  def get_status(bool)
    (bool) ? 'Active' : 'Disabled'
  end

  def get_role(int)
    case int
      when 0  then "Blocked"
      when 1  then "Administrator"
      when 2  then "Editor"
      when 3  then "User"
    end
  end

  def get_date(utc)
    utc.strftime("%m/%d/%Y")
  end

  def get_datetime(utc)
    utc.strftime("%l:%M%P - %m/%d/%Y")
  end
end
