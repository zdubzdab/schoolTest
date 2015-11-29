module TestSettingsHelper
  def all_subject_options
    Subject.all.map{|s| [s.name, s.id]}
  end

  def all_klass_options
    Klass.all.map{|s| [s.name, s.id]}
  end

  def all_theme_options
    Theme.all.map{|s| [s.name, s.id]}
  end
end
