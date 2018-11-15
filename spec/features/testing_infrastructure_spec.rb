
feature "Enter player names" do
  scenario "submitting names" do
    visit '/'
    fill_in :player_1_name, with: 'Will'
    fill_in :player_2_name, with: 'Alpha'
    click_button 'Submit'
    expect(page).to have_content "Will vs. Alpha"
  end
end

feature "player 2's hit Points" do
  scenario "display player 2's hit points " do
    visit '/'
    fill_in :player_1_name, with: 'Wayne'
    fill_in :player_2_name, with: 'Alpha'
    click_button 'Submit'
    expect(page).to have_content "Alpha - Hit points"
  end
end
