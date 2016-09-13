require 'rails_helper'
describe 'home descriptions' do
  before(:each) do
    FactoryGirl.create(:home_description)
  end
  context 'show in root_path' do
    it 'in English' do
      visit root_path(locale: 'en')
      expect(page).to have_content 'English title English text'
    end
    it 'in Polish' do
      visit root_path(locale: 'pl')
      expect(page).to have_content 'Polish title Polish text'
    end
  end
  context 'show in manager' do
    it 'view' do
      visit manager_path
      login
      expect(page).to have_selector(:link, 'Lista opisów ze strony głównej')
      click_on 'Lista opisów ze strony głównej'
      expect(page).to have_content('Lista opisów ze strony głównej')
      expect(page).to have_content('Polish title Polish text English title English text')
    end
  end
  context 'update' do
    it 'from home_description_path' do
      visit home_descriptions_path
      login
      click_on 'Edytuj'
      fill_in 'Tytuł po Polsku', with: 'Tytuł po Polsku'
      fill_in 'Opis po Polsku', with: '<p>Opis po Polsku</p>'
      fill_in 'Tytuł po Angielsku', with: 'Tytuł po Angielsku'
      fill_in 'Opis po Angielsku', with: '<p>Opis po Angielsku</p>'
      click_on 'Aktualizuj'
      expect(page).to have_content('Tytuł po Polsku <p>Opis po Polsku</p> Tytuł po Angielsku <p>Opis po Angielsku</p>')
      visit root_path(locale: 'en')
      expect(page).to have_content('Tytuł po Angielsku Opis po Angielsku')
      visit root_path(locale: 'pl')
      expect(page).to have_content('Tytuł po Polsku Opis po Polsku')
    end
  end
end
