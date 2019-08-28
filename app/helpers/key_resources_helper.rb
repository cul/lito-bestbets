module KeyResourcesHelper

  def comma_delimited_list_as_pills(list, color_class='primary', additional_classes='')
    return '' if list.blank?
    list.split(',').map do |item|
      "<a href=\"#\" class=\"badge badge-pill badge-#{color_class} #{additional_classes}\">#{item.strip}</a> "
    end.join('').html_safe
  end

end
