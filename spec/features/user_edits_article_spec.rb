require "rails_helper"

feature "Article Editing" do

  before(:each) do
    sign_up
  end  

  scenario "allows user to edit article" do
    aaa = Article.create!(title: 'Number 1', text: 'something')
    visit edit_article_path(id: aaa.id)

    fill_in :article_title, :with => 'Number 2'
    fill_in :article_text, :with => 'something_1'

    click_button 'Update Article'

    visit '/articles'
    expect(page).to have_content 'Number 2'

  end

end