feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, johnsmith@gmail.com')
    expect(User.first.email).to eq('johnsmith@gmail.com')
  end

  scenario 'requires a matching confirmation password' do 
    expect{bad_sign_up}.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect {bad_sign_up}.not_to change(User, :count)
    expect(current_path).to eq('/users') 
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'with a blank email field' do 
    expect{no_email_sign_up}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'with an invalid email address' do 
    expect{invalid_email_sign_up}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'with an email address tha already exists' do 
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
