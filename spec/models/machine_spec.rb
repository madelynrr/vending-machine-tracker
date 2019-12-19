require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe "instance methods" do
    it ".average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snickers = Snack.create(name: "Snickers", price: 1)
      bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
      mms = Snack.create(name: "M&Ms", price: 3)

      dons.snacks << [snickers, bbq, mms]

      expect(dons.average_price).to eq(2)
    end
  end
end
