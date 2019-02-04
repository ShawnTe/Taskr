require 'rails_helper'

RSpec.describe Detail, type: :model do

  it "has a valid factory for supply detail" do
    expect(build(:detail)).to be_valid
  end

  it "is not valid without a task_id" do
    detail = build(:detail, task_id: "")
    expect(detail).to_not be_valid
  end

  it "is not valid without a todo_id" do
    detail = build(:detail, todo_id: "")
    expect(detail).to_not be_valid
  end

  it "is not valid without a todo_type" do
    detail = build(:detail, todo_type: "")
    expect(detail).to_not be_valid
  end

end