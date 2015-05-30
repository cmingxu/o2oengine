module AdminHelper
  def sidebar_item_helper(text, href, icon, identifier)
    c = @current_active_nav.to_s == identifier.to_s ? "active sidebar_item" : "sidebar_item"
    text = fa_icon("fw #{icon}") + text
    content_tag(:div, content_tag(:a, text, :href => href), :class => c)
  end

  def breadcrumb
    content_tag(:div, raw(@breadcrumb.map{|b| raw(content_tag("a", b.text, :href => b.href))}.join), :class => "bread")
  end

end
