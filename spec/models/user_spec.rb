require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "follow relationship" do
    before do
      @following_user = FactoryBot.create(:user)
      @followed_user = FactoryBot.create(:user)
    end
    it "exists when following_user is following to followed_user" do
      Relationship.create(
        following_id: 2,
        follower_id: 1
      )

      expect(@following_user.following?(@followed_user)).to be_truthy
    end

    it "not exists when following_user is not following to followed_user" do
      expect(@following_user.following?(@followed_user)).to_not be_truthy
    end

    it "exists when followed_user is followed from following_user" do
      Relationship.create(
        following_id: 2,
        follower_id: 1
      )

      expect(@followed_user.followed_by?(@following_user)).to be_truthy
    end

    it "not exists when followed_user is not follow from following_user" do
      expect(@followed_user.followed_by?(@following_user)).to_not be_truthy
    end

    it "is created by following_user's follow action when relationship does not exist" do
      expect(@following_user.following?(@followed_user)).to_not be_truthy
      @following_user.follow(@followed_user)
      expect(@following_user.following?(@followed_user)).to be_truthy
    end

    it "is created by following_user's follow action when relationship already exists" do
      Relationship.create(
        following_id: 2,
        follower_id: 1
      )
      expect(@following_user.following?(@followed_user)).to be_truthy
      relationship = @following_user.follow(@followed_user)
      expect(relationship.follower_id).to eq 1
      expect(relationship.following_id).to eq 2
    end

    it "is destroyed by following_user's unfollow action when relationship exists" do
      Relationship.create(
        following_id: 2,
        follower_id: 1
      )
      expect(@following_user.unfollow(@followed_user)).to be_truthy
      expect(@following_user.following?(@followed_user)).to_not be_truthy
    end
  end

  describe "is invalid" do
    it "without email" do
      user = FactoryBot.build(:user, email:nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  end

  describe "returns name or email" do
    it "when name is blank and email is not blank" do
      user = FactoryBot.create(:user, name: nil, email: 'nakamura@sample.com')
      value = user.name_or_email
      expect(value).to eq 'nakamura@sample.com'
    end
    it "when name and email are not blank" do
      user = FactoryBot.create(:user, name: 'Nakamura', email: 'nakamura@sample.com')
      value = user.name_or_email
      expect(value).to eq 'Nakamura'
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
