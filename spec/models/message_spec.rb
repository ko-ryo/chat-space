require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without a body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end

    it "is valid with a body, image, group_id, user_id, created_at, updated_at" do
      message = build(:message)
      expect(message).to be_valid
    end
  end
end
