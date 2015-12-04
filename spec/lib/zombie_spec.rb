require 'spec_helper'
require 'zombie'

describe Zombie do
  it "is named Ash" do
    zombie = Zombie.new
    expect zombie.name == "Ash"
  end
  it "has no brains" do
    zombie = Zombie.new
    expect zombie.brains < 1
  end
  it "should not be alive" do
    zombie = Zombie.new
    expect zombie.alive == false
  end
  it "should be hungry" do
    zombie = Zombie.new
    expect zombie.hungry == true
    
  end
end
