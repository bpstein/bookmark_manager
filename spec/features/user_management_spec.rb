feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, johnsmith@gmail.com')
    expect(User.first.email).to eq('johnsmith@gmail.com')
  end

  scenario 'requires a matching confirmation password' do 
    expect{bad_sign_up}.not_to change(User, :count)
  end
end
