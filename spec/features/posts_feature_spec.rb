require 'rails_helper'

def create_new_user
  visit '/users/sign_up'
  fill_in 'user_user_name', with: 'Example Name'
  fill_in 'user_email', with: 'example@example.com'
  fill_in 'user_password', with: 'examplepassword'
  fill_in 'user_password_confirmation', with: 'examplepassword'
  click_button 'Sign up'
end


feature 'Users can upload a post' do
  scenario 'user uploads a new picture' do
    create_new_user
    visit '/posts'
    visit new_post_path
    page.attach_file("post_image", Rails.root + 'spec/fixtures/Cookies.jpg')
    fill_in 'Caption', with: 'Caption'
    click_button('Create Post')
    expect(page).to have_content("Caption")
  end
end
