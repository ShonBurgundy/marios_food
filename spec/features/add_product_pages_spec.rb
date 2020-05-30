require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit root_path
    click_link 'Add a new product'
    fill_in 'Name', :with => 'Oreos'
    fill_in 'Cost', :with => '4'
    fill_in 'Country', :with => 'usa'
    click_on 'Create Product'
    expect(page).to have_content 'Oreos'
  end

  it "gives an error when inputs are incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error when inputs are incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives an error when inputs are incomplete" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Country can't be blank"
  end
end