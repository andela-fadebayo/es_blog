module ApplicationHelper
  def friendly_date(d)
    d.strftime("%A %d %B, %Y %H:%M:%S")
  end
end
