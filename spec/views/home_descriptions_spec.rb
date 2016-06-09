require 'rails_helper'
describe 'show home descriptions' do
  before(:each) do
    FactoryGirl.create(:home_description)
  end
  context "in root_path" do
    it 'in English' do
      visit root_path(locale: 'en')
      expect(page).to have_content 'English title English text'
    end
    it 'in Polish' do
      visit root_path(locale: 'pl')
      expect(page).to have_content 'Polish title Polish text'
    end
  end
  context 'in manager' do
    it 'view' do
      visit home_descriptions_path
      login
      expect(page).to have_content('Lista opisów ze strony głównej')
      expect(page).to have_content('Polish title Polish text English title English text')
    end
  end
end
