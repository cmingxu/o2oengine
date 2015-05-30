module ApplicationHelper
  def dropdown display, *args, &block
    content_tag :div, :class => "dropdown" do
      content_tag(:a, display_and_cater(display, "sort-desc"), :class => "dropdown-handler") + content_tag(:ul, :class => "dropdown_menus dropdown-close", &block)
    end
  end

  def display_and_cater display, cater
    (display + " " + fa_icon(cater)).html_safe
  end

  def dropdown_item display, link, *args
    options = args.extract_options!
    options.merge!(:href => link)
    content_tag(:li, content_tag(:a, display, options))
  end
end
