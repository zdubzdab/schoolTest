module TestSettingsHelper
  def all_subject_options
    Subject.all.map{|s| [s.name, s.id]}
  end

  def all_klass_options
    Categgory.all.map{|s| [s.name, s.id]}
  end

  def all_theme_options
    Theme.all.map{|s| [s.name, s.id]}
  end

  def result(test)
    test.where(test_setting_id: @test_setting.id).maximum("complete_pers")
  end

  def test_created(test)
    test.created_at.strftime("%H:%M:%S  %d/%m/%y")
  end
end
