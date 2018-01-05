require 'rails_helper'

describe Bark do
  before do
    @rottweiler = User.create(name: "Daddy", email: "daddy@me.com", password: "daddyme", password_confirmation: "daddyme")
  end

  let(:attributes) do
    {
      user_id: 1,
      content: "this is a test"
    }
  end

  it "is considered valid" do
    expect(Bark.new(attributes)).to be_valid
  end

  let(:missing_user_id) { attributes.except(:user_id) }

  it "is invalid without a user id" do
    expect(Bark.new(missing_user_id)).not_to be_valid
  end

  let(:missing_content) { attributes.except(:content) }

  it "is invalid without content" do
    expect(Bark.new(missing_content)).not_to be_valid
  end

  let(:too_long_content) { attributes.merge(content: "this content is going to be way too long for our validation so it will not pass.... i think this will not pass..... i think this will not pass..... i think this will not pass..... i think this will not pass..... i think this will not pass...i think this will not pass..... i think this will not pass....i think this will not pass..... i think this will not pass ") }

  it "is invalid when content exceeds limit" do
    expect(Bark.new(too_long_content)).not_to be_valid
  end

end
