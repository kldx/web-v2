module ApplicationHelper
  def check_status obj
    case obj.status
    when 1
      "<span class='badge badge-primary'>Normal</span>".html_safe
    when 2
      "<span class='badge badge-danger'>Busy</span>".html_safe
    else
      "<span class='badge badge-warning'>Unavailable</span>".html_safe
    end
  end
end
