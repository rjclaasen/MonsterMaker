require 'rails_helper'

describe "Index requests", type: :request do
  
  before { create(:monster, name: "Monster name") }

  it "returns the monster info" do
    headers = { "ACCEPT" => "application/json" }
    get "/monsters.json"

    expect(response.media_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end
end