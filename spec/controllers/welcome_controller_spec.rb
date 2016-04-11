require 'rails_helper'

describe WelcomeController do

  describe "GET #index" do
    before { get :index }

    it { should respond_with(200) }
    it { should render_template('index') }

    it 'shows pagination' do
      tidings = FactoryGirl.create_list(:tiding, 10)
      expect(:index).to have_css('div#tiding_table_pagination')
    end
  end
end
