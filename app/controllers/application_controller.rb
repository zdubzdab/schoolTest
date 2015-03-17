class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sub_records
    @options = params[:class_caller].humanize.strip.constantize.send( "for_#{params[:class_calles].strip}", params[:calles_value])
    render text: view_context.options_from_collection_for_select(@options, :id, :name)
  end
end
