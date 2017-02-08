require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_env){TestSeeder.new}
  describe "equipment" do
    it "has many items through equips" do
      test_env.run_all
      owner = User.find(test_env.user_id)
      expect(owner.items.first).to be_instance_of(Item)
    end
  end
end
