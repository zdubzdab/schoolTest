module ApplicationHelper

  def categgory_options
    categgories = Categgory.all
    categgories.any? ? categgories.map{|s| [s.name, s.id]} : []
  end

  def theme_options
    themes = Theme.all
    themes.any? ? themes.map{|s| [s.name, s.id]} : []
  end

  def subject_options
    subjects = Subject.all
    subjects.any? ? subjects.map{|s| [s.name, s.id]} : []
  end

  def merge_filter_session_params params
    unless session[:filter].blank?
      session[:filter] = session[:filter].merge( { "#{ params[:class_calles] }" => params[:calles_value] } )
    else
      session[:filter] = {"#{params[:class_calles]}" => params[:calles_value]}
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  
  def date_format (date)
    date.strftime('%d/%m/%G')
  end

end

