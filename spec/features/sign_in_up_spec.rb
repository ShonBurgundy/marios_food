require 'rails_helper'

describe "sign up process" do
  it "signs up a user" do
    visit root_path
    click_link 'Sign up'
    fill_in 'Password', :with => 'Password1!'
    fill_in 'Password confirmation', :with => 'Password1!'
    click_on 'Sign Up'
    expect(page).to have_content 'Sign up | Sign in | Homepage'
  end

end