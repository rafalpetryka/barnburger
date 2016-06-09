require 'rails_helper'
describe 'show home descriptions' do
  before(:each) do
    FactoryGirl.create(:home_description)
  end
  it 'in Polish' do
    visit root_path
    expect(page).to have_content 'Polish titlePolish text'
  end
  it 'in English' do
    visit root_path(locale: 'en')
    expect(page).to have_content 'English titleEnglish text'
  end
end
