module ApplicationHelper
  def check_status obj
    case obj.status
    when 0
      "<span class='badge badge-primary'>Normal</span>".html_safe
    when 1
      "<span class='badge badge-danger'>Busy</span>".html_safe
    else
      "<span class='badge badge-warning'>Unavailable</span>".html_safe
    end
  end

  def check_article_status obj
    case obj.status
    when "pending"
      "<span class='badge badge-warning'>Pending</span>".html_safe
    when "approved"
      "<span class='badge badge-primary'>Approved</span>".html_safe
    when "rejected"
      "<span class='badge badge-danger'>Rejected</span>".html_safe
    end
  end
end
