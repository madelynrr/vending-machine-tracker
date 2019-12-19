require 'rails_helper'

RSpec.describe "as a user" do
  it "can visit machine show page and see names of all snacks associated with that vending machine and their prices" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)

    dons.snacks << [snickers, bbq]

    visit machine_path(dons)

    expect(page).to have_content(dons.location)
    expect(page).to have_content(snickers.name)
    expect(page).to have_content(snickers.price)
    expect(page).to have_content(bbq.name)
    expect(page).to have_content(bbq.price)
  end

  it "displays average price for all of the snacks in the machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
    mms = Snack.create(name: "M&Ms", price: 1)

    dons.snacks << [snickers, bbq, mms]

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $1.33")
    expect(page).not_to have_content("Average Price: 1.333")
  end
end
