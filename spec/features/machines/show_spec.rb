require 'rails_helper'

RSpec.describe "as a user" do
  it "can visit machine show page and see names of all snacks associated with that vending machine and their prices" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snickers = Snack.create(name: "Snickers", price: 1)
    bbq = Snack.create(name: "BBQ Potato Chips", price: 2)

    visit machine_path

    expect

  end
end
