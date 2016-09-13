require 'rails_helper'

describe 'check opening hours' do
  it 'should be valid with correct place zgoda' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, place: 'zlota')
    visit root_path
    expect(page).to have_content 'Zgoda 5 Godziny otwarcia Pon-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
  it 'should be valid with correct place zlota' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, place: 'zlota')
    visit root_path
    expect(page).to have_content 'Złota 9 Godziny otwarcia Pon-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
  it 'should be valid with monday different opening hours' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, monday: %w(1420 1745 1715), place: 'zlota')
    visit root_path
    expect(page).to have_content 'Złota 9 Godziny otwarcia Pon: 1420-1745 (grillujemy do 17:15)Wt-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
  it 'should be valid with tuesday different opening_hours' do
    FactoryGirl.create(:opening_hour, place: 'zlota')
    FactoryGirl.create(:opening_hour, tuesday: %w(1510 1755 1615))
    visit root_path
    expect(page).to have_content 'Zgoda 5 Godziny otwarcia Pon: 1200-2200 (grillujemy do 21:30)Wt: 1510-1755 (grillujemy do 16:15)Śr-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
  it 'should be valid with closed monday' do
    FactoryGirl.create(:opening_hour, place: 'zlota')
    FactoryGirl.create(:opening_hour, monday: ['nieczynne', '', ''])
    visit root_path
    expect(page).to have_content 'Zgoda 5 Godziny otwarcia Pon: nieczynneWt-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
  it 'should be valid with closed monday and tuesday' do
    FactoryGirl.create(:opening_hour)
    FactoryGirl.create(:opening_hour, monday: ['nieczynne', '', ''], tuesday: ['nieczynne', '', ''], place: 'zlota')
    visit root_path
    expect(page).to have_content 'Złota 9 Godziny otwarcia Pon-Wt: nieczynneŚr-Pt: 1200-2200 (grillujemy do 21:30)Sob: 1300-2200 (grillujemy do 21:30)Nd: 1300-2100 (grillujemy do 20:30)'
  end
end
describe 'Update opening hours' do
  let!(:opening_hour) { FactoryGirl.create(:opening_hour) }
  def check_hours_from_monday
    visit opening_hours_path
    login
    expect(page).to have_content 'Poniedziałek Wtorek Środa Czwartek Piątek Sobota Niedziela zgoda od 12:00 do 22:00 , grill do 21:30'
  end

  def update_monday
    click_on 'Edytuj'
    select '09', from: 'monday_11'
    select '05', from: 'monday_12'
    select '24', from: 'monday_21'
    select '00', from: 'monday_22'
    select '23', from: 'monday_31'
    select '55', from: 'monday_32'
    click_on 'Wyślij'
    expect(page).to have_content 'Poniedziałek Wtorek Środa Czwartek Piątek Sobota Niedziela zgoda od 09:05 do 24:00 , grill do 23:55'
  end
  it 'check hours from monday' do
    check_hours_from_monday
  end
  it 'from monday' do
    check_hours_from_monday
    update_monday
  end
  it 'and check on root_path' do
    check_hours_from_monday
    update_monday
    visit root_path
    expect(page).to have_content 'Pon: 0905-2400 (grillujemy do 23:55)'
  end
end
