require 'rails_helper'

describe "Reviews CRUD tests" do
  
  before(:each) do
    User.destroy_all
    User.create(:name => 'asdf', :email => 'test@test.com', :password => 'Asdfasdf1!', :password_confirmation => 'Asdfasdf1!', :admin => true)
    visit '/'
    click_link 'Sign in'

    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'Asdfasdf1!'
    click_button 'Sign in'
  end

  before(:each) do
    Product.destroy_all
    Product.create(:name => 'Food', :cost => 2, :country => 'spain', :id => nil)
  end

  it "adds a new review" do
    visit products_path
    click_link 'Food'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Me'
    fill_in 'Content', :with => 'this is going to be 50 character because it has to be at least that long to actually work!'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    expect(page).to have_content 'Me'
  end

  it "deletes a review" do
    visit products_path
    click_link 'Food'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Me'
    fill_in 'Content', :with => 'this is going to be 50 character because it has to be at least that long to actually work!'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    click_on 'Delete'
    expect(page).not_to have_content 'Me'
  end

  it "updates a review" do
    visit products_path
    click_link 'Food'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Me'
    fill_in 'Content', :with => 'this is going to be 50 character because it has to be at least that long to actually work!'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    click_on 'Me'
    click_on 'Edit Review'
    fill_in 'Author', :with => 'Sean'
    fill_in 'Content', :with => 'this is going a different 50 characters because it has to be at least that long to actually work!'
    fill_in 'Rating', :with => '5'
    click_on 'Update Review'
    expect(page).to have_content 'Sean'
  end

end