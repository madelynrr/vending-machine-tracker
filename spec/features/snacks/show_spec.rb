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

  it "displays list of vending machine locations with that snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    mikes  = owner.machines.create(location: "Mike's Place")

    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
    mms = Snack.create(name: "M&Ms", price: 1)

    dons.snacks << [snickers, bbq]
    mikes.snacks << [snickers, bbq, mms]

    visit snack_path(snickers)
    expect(page).to have_content("Locations:")
    expect(page).to have_content(dons.location)
    expect(page).to have_content(mikes.location)

    visit snack_path(mms)
    expect(page).to have_content(mikes.location)
    expect(page).not_to have_content(dons.location)
  end

  it "displays average price for the vending machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
    dons.snacks << [snickers, bbq]

    visit snack_path(snickers)

    within "#machine-#{dons.id}" do
      expect(page).to have_content("Average Price: $1.50")
    end
  end

  it "displays count of snacks in each vending machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
    dons.snacks << [snickers, bbq]

    visit snack_path(snickers)

    within "#machine-#{dons.id}" do
      expect(page).to have_content("Count of Snack Types: 2")
    end
  end
end
