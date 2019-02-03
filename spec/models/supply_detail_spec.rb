require 'rails_helper'

RSpec.describe SupplyDetail, type: :model do

  it "has a valid factory" do
    expect(build(:supply_detail)).to be_valid
  end

  it "is not valid without a name" do
    supply_detail = build(:supply_detail, name: "")
    expect(supply_detail).to_not be_valid
  end

end
