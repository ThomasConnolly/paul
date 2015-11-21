require 'rails_helper'

RSpec.describe Post do 
  let(:post) {Post.new}
  it "is not valid without content" do
    expect(post).not_to be_valid
  end
  it "is not valid without title" do
    expect(post).not_to be_valid
  end
  it "is valid with proper data" do
    post.title = "a" * 101
    expect(post).to be_valid
  end

end
