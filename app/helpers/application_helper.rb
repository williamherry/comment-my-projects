module ApplicationHelper
  def alert_box(class_name, message)
    if message.present?
      message_tag = content_tag(:div, message)
      button_tag = content_tag(:button, "x", class: "close", data: { dismiss: "alert" })
      content_tag :div, button_tag + message_tag , class: "alert alert-#{class_name}"
    end
  end

  def page_title(title)
    content_for(:title, title)
  end

  def browser_title(title = nil)
    [(title if title.present?), "Comment My Projects"].compact.join(" - ")
  end

  def markdown(code)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    raw(markdown.render(code))
  end

  def avatar_url(user, size=100)
    return "/assets/guest.png" if user.nil?
    avatar_id = Digest::MD5.hexdigest(user.email.downcase)
    default_url = "http://#{request.host}:#{request.port}/assets/guest.png"
    "http://gravatar.com/avatar/#{avatar_id}.png" \
      "?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
