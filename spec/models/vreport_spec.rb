require 'rails_helper'

RSpec.describe Vreport do
  let(:vreport) {Vreport.new}

  it "is not valid without a title" do
    expect(vreport).not_to be_valid
    end 

  it "is not valid with a title longer than 100 symbols" do
    vreport.title = 'a' * 120
    expect(vreport).not_to be_valid
  end

  it "is valid with proper data" do
    vreport.title = "a" * 50
    expect(vreport).to be_valid
  end
end