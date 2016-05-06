def add_link
  visit '/links/new'
  fill_in :title, with:  'eBay'
  fill_in :url, with: 'www.ebay.com'
  fill_in :tags, with: 'Shopping'
  click_button "Add!"
end

def sign_up
  visit '/users/new'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def bad_sign_up 
  visit '/users/new'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges'
  click_button 'Sign up'
end

def no_email_sign_up
  visit '/users/new'
  fill_in :email, with: ''
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def invalid_email_sign_up
  visit '/users/new'
  fill_in :email, with: 'invalid@email'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end 
