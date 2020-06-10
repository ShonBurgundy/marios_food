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

  it "adds a new review" do
    test_product = Product.create(:name => 'Food', :cost => 2, :country => 'spain', :id => nil)
    id = test_product.id
    visit products_path
    click_link 'Food'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Me'
    fill_in 'Content', :with => 'this is going to be 50 character because it has to be at least that long to actually work its got to be long, super long!!!!!!!'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    expect(page).to have_content 'Me'
  end

end