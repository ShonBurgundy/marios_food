require 'rails_helper'

describe Product do
  it {should have_many(:reviews)}

  it("titleizes the name of a product") do
    product = Product.create({name: "apple", cost: 2, country: "usa"})
    expect(product.name()).to(eq("Apple"))
  end
end