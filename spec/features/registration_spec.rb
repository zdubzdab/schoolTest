require 'rails_helper'

feature "Student registration" do

  context "with valid details" do

    scenario "" do
      create_categgory
      guest_visit_registration_page

      guest_fill_form_and_push_button

      guest_became_student
      guest_should_be_redirected_to_student_root_page
      guest_should_see_message_successfully_registration
    end

  end

  def create_categgory
    FactoryGirl.create(:categgory)
  end

  def guest_visit_registration_page
    visit "/"

    click_link t('buttons.sign_up')
    expect(current_path).to eq(new_user_registration_path)

    click_link t('devise.registrations.new.buttons.student')
  end

  def guest_fill_form_and_push_button
    fill_in "Прізвище Ім'я Побатькові", with: "Student", match: :first
    fill_in "Емейл", with: "tester@example.com", match: :first
    select "class1", from: "user[categgory_id]"
    fill_in "Пароль", with: "password", match: :first
    fill_in "Підтвердження паролю", with: "password", match: :first
    click_button t('buttons.submit'), match: :first
  end

  def guest_became_student
    expect { change { User }.by 1 }
  end

  def guest_should_be_redirected_to_student_root_page
    expect(current_path).to eq (root_path)
    expect(page).to have_link(t('layouts.header.buttons.edit_profile'))
    expect(page).to have_link(t('layouts.header.buttons.sign_out'))
    expect(page).to have_link(t('layouts.header.buttons.comments'))
    expect(page).to have_link(t('layouts.header.buttons.pass_test'))
    expect(page).to have_link(t('layouts.header.buttons.teachers'))
    expect(page).to have_link(t('layouts.header.buttons.methodical_works'))
  end

  def guest_should_see_message_successfully_registration
    expect(page).to have_content( t('devise.registrations.signed_up'))
  end

  context "with invalid details" do

    before { guest_visit_registration_page }

    scenario "blank fields" do
      guest_doesnt_fill_form

      guest_doesnt_became_student
      guest_should_see_message_you_form_is_blank
    end

    scenario "incorrect password confirmation" do
      guest_fill_incorrect_password_conf

      guest_doesnt_became_student
      guest_should_see_message_incorrect_password_conf
    end

    scenario "already registered email" do
      create(:user, email: "registred@gmail.com")

      guest_fill_already_registered_email

      guest_doesnt_became_student
      guest_should_see_message_email_is_taken
    end

    scenario "invalid email" do
      guest_fill_invalid_email

      guest_doesnt_became_student
      guest_should_see_message_email_is_invalid
    end

    scenario "too short password" do
      guest_fill_too_short_password

      guest_doesnt_became_student
      guest_should_see_message_too_short_password
    end

  end

  def guest_doesnt_fill_form
    click_button t('buttons.submit'), match: :first
  end

  def guest_should_see_message_you_form_is_blank
    expect(page).to have_content( t('activerecord.errors.models.user.attributes.full_name.too_short') )
    expect(page).to have_content( t('errors.messages.bad_email_format') )
    expect(page).to have_content( t('activerecord.attributes.user.full_name') )
    expect(page).to have_content( t('activerecord.attributes.user.email') )
    expect(page).to have_content( t('activerecord.attributes.user.password') )
    expect(page).to have_content( t('errors.messages.blank') )
  end

  def guest_doesnt_became_student
    expect { not_to_change { User } }
  end

  def guest_fill_incorrect_password_conf
    fill_in "Прізвище Ім'я Побатькові", with: "Student", match: :first
    fill_in "Емейл", with: "registred@gmail.com", match: :first
    fill_in "Пароль", with: "password", match: :first
    fill_in "Підтвердження паролю", with: "paswwwww", match: :first
    click_button t('buttons.submit'), match: :first
  end

  def guest_should_see_message_incorrect_password_conf
    expect(page).to have_content( t('errors.messages.confirmation') )
  end

  def guest_fill_already_registered_email
    fill_in "Прізвище Ім'я Побатькові", with: "Student", match: :first
    fill_in "Емейл", with: "registred@gmail.com", match: :first
    fill_in "Пароль", with: "password", match: :first
    fill_in "Підтвердження паролю", with: "password", match: :first
    click_button t('buttons.submit'), match: :first
  end

  def guest_should_see_message_email_is_taken
    expect(page).to have_content( t('activerecord.attributes.user.email') )
    expect(page).to have_content( t('errors.messages.taken') )
  end

  def guest_fill_invalid_email
    fill_in "Прізвище Ім'я Побатькові", with: "Student", match: :first
    fill_in "Емейл", with: "testerexample.com", match: :first
    fill_in "Пароль", with: "password", match: :first
    fill_in "Підтвердження паролю", with: "password", match: :first
    click_button t('buttons.submit'), match: :first
  end

  def guest_should_see_message_email_is_invalid
    expect(page).to have_content( t('errors.messages.bad_email_format') )
    expect(page).to have_content( t('activerecord.attributes.user.email') )
  end

  def guest_fill_too_short_password
    fill_in "Прізвище Ім'я Побатькові", with: "Student", match: :first
    fill_in "Емейл", with: "tester@example.com", match: :first
    fill_in "Пароль", with: "pass", match: :first
    fill_in "Підтвердження паролю", with: "pass", match: :first
    click_button t('buttons.submit'), match: :first
  end

  def guest_should_see_message_too_short_password
    expect(page).to have_content( t('activerecord.attributes.user.password') )
    expect(page).to have_content( t('errors.messages.too_short') )
  end

end


feature "Teacher registration" do

  context "with valid details" do

    scenario "" do
      create_subject
      guest_visit_registration_page

      guest_fill_form_and_push_button

      guest_became_teacher
      guest_should_be_redirected_to_teacher_root_page
      guest_should_see_message_successfully_registration
    end

  end

  def create_subject
    FactoryGirl.create(:subject)
  end

  def guest_visit_registration_page
    visit "/"

    click_link t('buttons.sign_up')
    expect(current_path).to eq(new_user_registration_path)

    click_link t('devise.registrations.new.buttons.teacher')
  end

  def guest_fill_form_and_push_button
    find('#teacher_full_name').set('Student')
    find('#teacher_email').set('tester@example.com')
    select "Name№1", from: "user[subject_id]"
    find('#teacher_password').set('password')
    find('#teacher_password_confirm').set('password')
    find("#b_teacher_registration").click
  end

  def guest_became_teacher
    expect { change { User }.by 1 }
  end

  def guest_should_be_redirected_to_teacher_root_page
    expect(current_path).to eq (root_path)
    expect(page).to have_link(t('layouts.header.buttons.main'))
    expect(page).to have_link(t('layouts.header.buttons.testing'))
    expect(page).to have_link(t('layouts.header.buttons.edit_profile'))
    expect(page).to have_link(t('layouts.header.buttons.sign_out'))
    expect(page).to have_link(t('layouts.header.buttons.new_test'))
    expect(page).to have_link(t('layouts.header.buttons.comments'))
    expect(page).to have_link(t('layouts.header.buttons.teachers'))
    expect(page).to have_link(t('layouts.header.buttons.new_methodical_work'))
    expect(page).to have_link(t('layouts.header.buttons.methodical_works'))
  end

  def guest_should_see_message_successfully_registration
    expect(page).to have_content( t('devise.registrations.signed_up'))
  end

  context "with invalid details" do

    before { guest_visit_registration_page }

    scenario "blank fields" do
      guest_doesnt_fill_form

      guest_doesnt_became_teacher
      guest_should_see_message_you_form_is_blank
    end

    scenario "incorrect password confirmation" do
      guest_fill_incorrect_password_conf

      guest_doesnt_became_teacher
      guest_should_see_message_incorrect_password_conf
    end

    scenario "already registered email" do
      create(:user, email: "registred@gmail.com")

      guest_fill_already_registered_email

      guest_doesnt_became_teacher
      guest_should_see_message_email_is_taken
    end

    scenario "invalid email" do
      guest_fill_invalid_email

      guest_doesnt_became_teacher
      guest_should_see_message_email_is_invalid
    end

    scenario "too short password" do
      guest_fill_too_short_password

      guest_doesnt_became_teacher
      guest_should_see_message_too_short_password
    end

  end

  def guest_doesnt_fill_form
    find("#b_teacher_registration").click
  end

  def guest_should_see_message_you_form_is_blank
    expect(page).to have_content( t('activerecord.errors.models.user.attributes.full_name.too_short') )
    expect(page).to have_content( t('errors.messages.bad_email_format') )
    expect(page).to have_content( t('activerecord.attributes.user.full_name') )
    expect(page).to have_content( t('activerecord.attributes.user.email') )
    expect(page).to have_content( t('activerecord.attributes.user.password') )
    expect(page).to have_content( t('errors.messages.blank') )
  end

  def guest_doesnt_became_teacher
    expect { not_to_change { User } }
  end

  def guest_fill_incorrect_password_conf
    find('#teacher_full_name').set('Student')
    find('#teacher_email').set('tester@example.com')
    find('#teacher_password').set('password')
    find('#teacher_password_confirm').set('passssss')
    find("#b_teacher_registration").click
  end

  def guest_should_see_message_incorrect_password_conf
    expect(page).to have_content( t('errors.messages.confirmation') )
  end

  def guest_fill_already_registered_email
    find('#teacher_full_name').set('Student')
    find('#teacher_email').set('registred@gmail.com')
    find('#teacher_password').set('password')
    find('#teacher_password_confirm').set('passssss')
    find("#b_teacher_registration").click
  end

  def guest_should_see_message_email_is_taken
    expect(page).to have_content( t('activerecord.attributes.user.email') )
    expect(page).to have_content( t('errors.messages.taken') )
  end

  def guest_fill_invalid_email
    find('#teacher_full_name').set('Student')
    find('#teacher_email').set('registredgmail.com')
    find('#teacher_password').set('password')
    find('#teacher_password_confirm').set('passssss')
    find("#b_teacher_registration").click
  end

  def guest_should_see_message_email_is_invalid
    expect(page).to have_content( t('errors.messages.bad_email_format') )
    expect(page).to have_content( t('activerecord.attributes.user.email') )
  end

  def guest_fill_too_short_password
    find('#teacher_full_name').set('Student')
    find('#teacher_email').set('registred@gmail.com')
    find('#teacher_password').set('pass')
    find('#teacher_password_confirm').set('passssss')
    find("#b_teacher_registration").click
  end

  def guest_should_see_message_too_short_password
    expect(page).to have_content( t('activerecord.attributes.user.password') )
    expect(page).to have_content( t('errors.messages.too_short') )
  end

end
