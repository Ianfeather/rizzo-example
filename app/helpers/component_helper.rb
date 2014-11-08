module ComponentHelper

  def ui_component(type, properties={})
    load_stylesheet(type)
    render "components/#{type}/#{type}", properties
  end

  def styleguide_component(type, properties={})
    capture_haml do
      haml_tag(:div, class: "styleguide-block") do
        haml_tag(:div) do
          haml_concat ui_component(type, properties)
        end
        haml_concat render "styleguide/description", properties
      end
    end
  end

  def load_stylesheet(type)
    path = "#{type}/#{type}"
    content_for(:stylesheets) do
      haml_tag(:link, rel: "stylesheet", href: "#{stylesheet_path(path)}")
    end
  end

  def get_component_data(component)
    YAML.load(File.read(File.expand_path("../../../app/views/components/#{component}/#{component}.yml", __FILE__)))
  end

end
