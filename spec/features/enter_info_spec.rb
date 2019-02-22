require'./app.rb'

describe 'Enter the name and birthday', type: :feature do
  before :each do
    @name = 'Anu'
  end

  it 'submits the name and birthday' do
    enter_info(@name,'11','April')
    expect(page).to have_content @name
  end
  it 'says happy birthday' do
    enter_info(@name, Time.new.day.to_s,Date.today.strftime("%B"))
    expect(page).to have_content 'Happy Birthday Anu!'
  end

    it 'submits a date that is after today' do
      enter_info(@name,'11','April')
      expect(page).to have_content 'Your birthday will be in 47 days, Anu!'
    end

    it 'submits a date that is before today' do
      enter_info(@name,'1','January')
      expect(page).to have_content 'Your birthday will be in 313days, Anu!'
    end
end
