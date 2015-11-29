module RegistrationHelper
  def klass_options
    Categgory.all.map{|k| [k.name, k.id]}
  end
end