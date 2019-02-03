require 'rails_helper'

RSpec.describe Task, type: :model do

  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end

  it "is valid with valid attributes" do
    task = create(:task)
    expect(task).to be_valid
  end

  it "is not valid without a title" do
    task = build(:task, title: "")
    expect(task).to_not be_valid
  end

  it "is not valid without a next_due_date" do
    task = build(:task, next_due_date: "")
    expect(task).to_not be_valid
  end

end



