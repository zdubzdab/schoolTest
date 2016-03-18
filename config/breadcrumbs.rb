#guests
crumb :root do
  link t('gretel.home'), root_path
end

crumb :comments_new do
  link t('gretel.add_suggestion'), new_comment_path
end

crumb :watch_teachers do
  link t('gretel.teachers'), users_path
end

crumb :watch_new do
  link t('gretel.watch_new'), users_path
end

#teachers
crumb :edit_profile do
  link t('gretel.edit'), edit_user_registration_path
end

crumb :teachers_test_settings do
  link t('gretel.watch_tests'), teachers_test_settings_path
end

crumb :teachers_test_settings_show do |test_setting|
  link t('gretel.test_result'), teachers_test_setting_path(test_setting)
  parent :teachers_test_settings
end

crumb :test_result do |test_setting|
  link t('gretel.user_test_result')
  parent :teachers_test_settings_show, test_setting
end

crumb :teachers_test_settings_show_edit do |test_setting|
  link t('gretel.test_edit')
  parent :teachers_test_settings_show, test_setting
end

crumb :teachers_test_settings_new do
  link t('gretel.test_creation')
end

#admin
crumb :admin_comments do
  link t('gretel.suggestions_list')
end

crumb :admin_students do
  link t('gretel.students_list'), admin_students_path
end

crumb :admin_students_edit do
  link t('gretel.edit_student')
  parent :admin_students
end

crumb :admin_teachers do
  link t('gretel.teachers_list'), admin_users_path
end

crumb :admin_teachers_edit do
  link t('gretel.edit_teacher')
  parent :admin_teachers
end

crumb :admin_tidings_new do
  link t('gretel.tiding_new')
end

crumb :admin_tidings do
  link t('gretel.tidings_list'), admin_tidings_path
end

crumb :admin_tidings_edit do
  link t('gretel.edit_tiding')
  parent :admin_tidings
end

#students
