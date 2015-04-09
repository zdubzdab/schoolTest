module ApplicationHelper
  def theme_options filter_session
    themes = Theme.for_subject filter_session.try(:[], 'subject')
    themes.any? ? themes.map{|s| [s.name, s.id]} : []
  end

  def subject_options filter_session
    subjects = Subject.for_klass filter_session.try(:[], 'klass')
    subjects.any? ? subjects.map{|s| [s.name, s.id]} : []
  end

  def merge_filter_session_params params
    unless session[:filter].blank?
      session[:filter] = session[:filter].merge( { "#{ params[:class_calles] }" => params[:calles_value] } )
    else
      session[:filter] = {"#{params[:class_calles]}" => params[:calles_value]}
    end
  end
end
