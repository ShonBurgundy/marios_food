require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country }

  it("titleizes the name of a product") do
    product = Product.create({name: "apple", cost: 2, country: "usa"})
    expect(product.name()).to(eq("Apple"))
  end
end