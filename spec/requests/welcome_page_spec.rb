require 'rails_helper'

  describe "Welcome page" do

    subject { page }

    describe "for guests" do
      before { visit root_path }

      it { should have_content("школа №") }
      it { should have_content("Пошук") }
      it { should have_content("Новини") }

      it "should have the right links on the layout" do
        click_link "Вчителі"
        expect(page).to have_content("Наші вчителі")
        expect(page).to have_content("Прізвище Ім'я Побатькові")
        expect(page).to have_content("Емейл")
        expect(page).to have_content("Фото")
        # visit root_path
        # click_link "Додати пропозицію"
        # expect(page).to have_field("Email")
        # expect(page).to have_field("Password")
        # expect(page).to have_button("Log in")
        # visit root_path
        # click_button "Метод. роботи"
        # expect(page).to have_field("Email")
        # expect(page).to have_field("Password")
        # expect(page).to have_button("Log in")
        # visit root_path
        # click_button "Логін"
        # expect(page).to have_field("Email")
        # expect(page).to have_field("Password")
        # expect(page).to have_button("Log in")
        # visit root_path
        # click_button "Реєстрація"
        # expect(page).to have_content("Sign up")
        # expect(page).to have_field("Name")
        # expect(page).to have_field("Email")
        # expect(page).to have_field("Password")
        # expect(page).to have_field("Password confirmation")
        # expect(page).to have_button("Sign up")
      end
    end
  end
