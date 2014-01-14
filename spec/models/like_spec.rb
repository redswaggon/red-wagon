require 'spec_helper'

describe Like do
  describe "determines if a user already liked another" do
    context "returns true if user has already liked the other" do
      it "returns true" do
        dan = create(:user)
        mike = create(:user)
        Like.create(user_id: dan.id, liked_user_id: mike.id)
        expect(Like.already_liked?(dan.id, mike.id)).to be_true
      end
    end

    context "returns false if user has not yet liked the other" do
      it "returns false" do
        dan = create(:user)
        mike = create(:user)
        expect(Like.already_liked?(dan.id, mike.id)).to be_false
      end
    end
  end
end