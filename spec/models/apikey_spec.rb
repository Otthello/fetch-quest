require 'rails_helper'

RSpec.describe Apikey, type: :model do
  it "creates a access key on save" do
    key = Apikey.new
    expect(key.access_token).to eq(nil)
    expect(key.save).to eq(true)
    expect(key.access_token.nil?).to eq(false)
  end
end
