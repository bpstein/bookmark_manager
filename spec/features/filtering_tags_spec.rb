feature 'Filter tags' do
  scenario 'displays only filtered sites' do
    add_link
    visit '/links/new'
    fill_in :title, with:  'Amazon'
    fill_in :url, with: 'www.amazon.com'
    fill_in :tags, with: 'Shopping'
    click_button "Submit"
    visit '/links/new'
    fill_in :title, with:  'Hulu'
    fill_in :url, with: 'www.hulu.com'
    fill_in :tags, with: 'Media'
    click_button "Submit"
    visit '/links/shopping'
    expect(page).to have_content('Amazon')
    expect(page).not_to have_content('Hulu')

  end
end