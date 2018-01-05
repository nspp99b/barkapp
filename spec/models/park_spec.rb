require 'rails_helper'

describe 'Park' do

  before do
    @rottweiler = User.create(name: "Daddy", email: "daddy@me.com")
    @doberman = User.create(name: "Gramma", email: "gramma@me.com")
    @dogrun = Park.create(name: "Dog Run", address: "11 Broadway", description: "It's a dog run")
    @review1 = Review.create(user: @rottweiler, park: @dogrun, content: "pretty good", overall: 5, facilities: 5, energy_level: 5, scene: 5)
    @review2 = Review.create(user: @doberman, park: @dogrun, content: "meh", overall: 3, facilities: 3, energy_level: 3, scene: 3)
  end

  it 'has a name' do
    expect(@dogrun.name).to eq("Dog Run")
  end

  it 'has an address' do
    expect(@dogrun.address).to eq("11 Broadway")
  end

end
