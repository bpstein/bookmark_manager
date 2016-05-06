feature 'User sign in' do
  scenario 'I can sign in' do
    sign_in
    expect {sign_in}.not_to change(User, :count)
    expect(page).to have_content('Please sign in!')
  end
end
