require 'rails_helper'

describe "Product CRUD tests" do

  before(:each) do
    User.destroy_all
    User.create(:name => 'asdf', :email => 'test@test.com', :password => 'Asdfasdf1!', :password_confirmation => 'Asdfasdf1!', :admin => true)
    visit '/'
    click_link 'Sign in'

    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'Asdfasdf1!'
    click_button 'Sign in'
  end

  it "adds a new product" do
    visit root_path
    click_link 'Add a new product'
    fill_in 'Name', :with => 'Oreos'
    fill_in 'Cost', :with => '4'
    fill_in 'Country', :with => 'usa'
    click_on 'Create Product'
    expect(page).to have_content 'Oreos'
  end

  it "deletes a product" do
    test_product = Product.create(:name => 'Food', :cost => 2, :country => 'spain', :id => nil)
    id = test_product.id
    visit products_path
    click_link 'Food'
    click_on 'Delete'
    visit products_path
    expect(page).not_to have_content'Food'
  end

  it "updates a product" do
    test_product = Product.create(:name => 'Food', :cost => 2, :country => 'spain', :id => nil)
    id = test_product.id
    visit products_path
    click_link 'Food'
    click_link 'Edit'
    fill_in 'Name', :with => 'Oreos'
    fill_in 'Cost', :with => '4'
    fill_in 'Country', :with => 'usa'
    click_on 'Update Product'
    visit products_path
    expect(page).to have_content 'Oreos'
  end

  it "gives an error when name is incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error when cost is incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives an error when country is incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Country can't be blank"
  end
end