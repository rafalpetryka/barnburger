require 'rails_helper'

describe 'check opening hours' do
  it 'should be valid with correct place zgoda' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, place: 'zlota')
    visit root_path
    expect(page).to have_content "Zgoda 5 Godziny otwarcia Pon-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
  it 'should be valid with correct place zlota' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, place: 'zlota')
    visit root_path
    expect(page).to have_content "Złota 9 Godziny otwarcia Pon-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
  it 'should be valid with monday different opening hours' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, monday: ['1420', '1745', '1715'], place: 'zlota')
    visit root_path
    expect(page).to have_content "Złota 9 Godziny otwarcia Pon: 1420-1745 (grillujemy do 17:15)Wt-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
  it 'should be valid with tuesday different opening_hours' do
    FactoryGirl.create(:opening_hour, place: 'zlota')
    FactoryGirl.create(:opening_hour, tuesday: ['1510', '1755', '1615'])
    visit root_path
    expect(page).to have_content "Zgoda 5 Godziny otwarcia Pon: 1200-2200 (grillujemy do 21:30)Wt: 1510-1755 (grillujemy do 16:15)Śr-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
  it 'should be valid with closed monday' do
    FactoryGirl.create(:opening_hour, place: 'zlota')
    FactoryGirl.create(:opening_hour, monday: ['nieczynne', '', ''])
    visit root_path
    expect(page).to have_content "Zgoda 5 Godziny otwarcia Pon: nieczynneWt-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
  it 'should be valid with closed monday and tuesday' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, monday: ['nieczynne', '', ''], tuesday: ['nieczynne', '', ''], place: 'zlota')
    visit root_path
    expect(page).to have_content "Złota 9 Godziny otwarcia Pon-Wt: nieczynneŚr-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)"
  end
end
