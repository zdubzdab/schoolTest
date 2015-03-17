module RegistrationHelper
  def klass_options
    Klass.all.map{|k| [k.name, k.id]}
  end
end