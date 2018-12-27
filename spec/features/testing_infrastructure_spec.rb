
feature "Enter player names" do
  scenario "submitting names" do
  sign_in_and_play
    expect(page).to have_content "Will vs. Alpha"
  end
end

feature "player 2's hit Points" do
  scenario "display player 2's hit points " do
  sign_in_and_play
    expect(page).to have_content "Alpha - Hit points"
  end
end

feature "Attacking" do
  scenario "attack player 2 " do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Will attacked Alpha'
  end
end
