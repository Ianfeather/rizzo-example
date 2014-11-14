module ComponentHelper

  def ui_component(type, properties={})
    load_stylesheet(type)
    render "components/#{type}/#{type}", properties
  end

  def get_component_data(component)
    YAML.load(File.read(File.expand_path("../../../app/views/components/#{component}/#{component}.yml", __FILE__)))
  rescue
    nil
  end

  def all_components
    Dir.glob("app/views/components/**/*.yml").map{|c|c.split("/")[-2]}
  end

  private

  def load_stylesheet(type)
    path = "#{type}/#{type}"

    return if loaded_stylesheets.include? path
    loaded_stylesheets << path

    content_for(:stylesheets) do
      haml_tag(:link, rel: "stylesheet", href: "#{stylesheet_path(path)}")
    end
  end

  def loaded_stylesheets
    @loaded_stylesheets ||= []
  end

end
