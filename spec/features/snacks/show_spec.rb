require 'rails_helper'

RSpec.describe "as a user" do
  it "can visit a snack show page and see the name and price of the snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    mikes  = owner.machines.create(location: "Mike's Place")

    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
    mms = Snack.create(name: "M&Ms", price: 1)

    dons.snacks << [snickers, bbq]
    mikes.snacks << [snickers, bbq, mms]

    visit snack_path(snickers)

    expect(page).to have_content(snickers.name)
    expect(page).to have_content("Price: #{snickers.price}")
  end
end
