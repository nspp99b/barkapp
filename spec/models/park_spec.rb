require 'rails_helper'

describe Park do
  let(:attributes) do
    {
      name: "Park Tester",
      address: "123 8th Ave, NY NY 11111",
      description: "this is the best park"
    }
  end

  it "is considered valid" do
    expect(Park.new(attributes)).to be_valid
  end

   let(:missing_name) { attributes.except(:name) }
   let(:missing_address) { attributes.except(:address) }
   let(:missing_description) { attributes.except(:description) }

   it "is invalid without a name" do
     expect(Park.new(missing_name)).not_to be_valid
   end

   it "is invalid without an address" do
     expect(Park.new(missing_address)).not_to be_valid
   end

    it "is invalid without a description" do
      expect(Park.new(missing_description)).not_to be_valid
    end

   let(:description_too_long) { attributes.merge(description: "this content is going to be way too long for our validation so it will not pass.... i think this will not pass..... i think this will not pass..... i think this will not pass..... i think this will not pass..... i think this will not pass...i think this will not pass..... i think this will not pass....i think this will not pass..... i think this will not pass") }

   it "is invalid a description that is too long" do
     expect(Park.new(description_too_long)).not_to be_valid
   end


end


#
#   before do
#     @rottweiler = User.create(name: "Daddy", email: "daddy@me.com")
#     @doberman = User.create(name: "Gramma", email: "gramma@me.com")
#     @dogrun = Park.create(name: "Dog Run", address: "11 Broadway", description: "It's a dog run")
#     @review1 = Review.create(user: @rottweiler, park: @dogrun, content: "pretty good", overall: 5, facilities: 5, energy_level: 5, scene: 5)
#     @review2 = Review.create(user: @doberman, park: @dogrun, content: "meh", overall: 3, facilities: 3, energy_level: 3, scene: 3)
#   end
#
#
#
#
#
#   it 'has a name' do
#     expect(@dogrun.name).to eq("Dog Run")
#   end
#
#   it 'has an address' do
#     expect(@dogrun.address).to eq("11 Broadway")
#   end
#
# end
