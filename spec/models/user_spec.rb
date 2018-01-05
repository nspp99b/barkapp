require 'rails_helper'

describe User do
  let(:attributes) do
    {
      name: "Sammie",
      email: "sammie@me.com",
      password: "sammieme",
      password_confirmation: "sammieme"
    }
  end

  it "is considered valid" do
    expect(User.new(attributes)).to be_valid
  end

   let(:missing_name) { attributes.except(:name) }
   let(:too_long_name) { attributes.merge(name: "this_name_is_way_too_long_but_you_know_it_is_good_to_test_these-things") }

   it "is invalid without a name" do
     expect(User.new(missing_name)).not_to be_valid
   end

   it "is invalid with a name that is too long" do
     expect(User.new(too_long_name)).not_to be_valid
   end

   let(:missing_email) { attributes.except(:email) }
   # let(:too_long_email) { attributes.merge(email: "this_name_is_way_too_long_but_you_know_it_is_good_to_test_these-things_so_I_am_going_to_make_this_past_the_limit_so_ill_say_it_again_this_name_is_way_too_long_but_you_know_it_is_good_to_test_these-things_so_I_am_going_to_make_this_past_the_limit_sooooooo@me.com") }

   it "is invalid without an email" do
     expect(User.new(missing_email)).not_to be_valid
   end

   # it "is invalid with an email that is too long" do
   #   expect(User.new(too_long_email)).not_to be_valid
   # end

   let(:too_short_password) { attributes.merge(password: "test", password_confirmation: "test") }
   let(:wrong_confirmation) { attributes.merge(password_confirmation: "sammiemee") }


   it "is invalid with a password that is too short" do
     expect(User.new(too_short_password)).not_to be_valid
   end

   it "is invalid with a password confirmation that does not match" do
     expect(User.new(wrong_confirmation)).not_to be_valid
   end




end
