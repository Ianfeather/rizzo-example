module ComponentHelper

  def ui_component(slug, properties={})
    render "components/#{slug}/#{slug}", properties
  end

  def styleguide_component(slug, properties={})
    capture_haml do
      haml_tag(:div, class: "styleguide-block") do
        haml_tag(:div) do
          haml_concat ui_component(slug, properties)
        end
        haml_concat render "styleguide/description", properties: properties[:properties]
      end
    end
  end

  def load_stylesheet(type)
    path = "#{type}/#{type}"
    content_for(:stylesheets) do
      haml_tag(:link, rel: "stylesheet", href: "#{stylesheet_path(path)}")
    end
  end

end
