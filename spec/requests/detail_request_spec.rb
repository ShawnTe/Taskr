require 'rails_helper'

RSpec.describe "Details", type: :request do
  it "denies access to details#new" do
    get new_detail_path
    expect(response).to redirect_to sign_in_path
  end

  it "denies access to details#create" do
    detail_attributes = FactoryBot.attributes_for(:detail)

    expect {
      post "/details", { "detail" => detail_attributes }
    }.to_not change(Detail, :count)

    expect(response).to redirect_to sign_in_path
  end
end