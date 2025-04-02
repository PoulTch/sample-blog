require "rails_helper"

feature "Comment Creation" do
  before(:each) do
    sign_up
  end

  scenario "allows user to create new comment" do
    aaa = Article.create!(title: 'Number 1', text: 'something')    
    visit article_path(id: aaa.id)
                
    fill_in :comment_body, :with => 'Bla bla bla'

    click_button 'Create Comment'
      
    expect(page).to have_content 'Bla bla bla'
  end  
end