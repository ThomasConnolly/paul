<<<<<<< HEAD
# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

describe Post do  
  describe :comments do
    it 'can manage comment models' do
      post = Post.create(title: 'A post', content: 'Indeed it is.')

      # Insert comments
      expect {
        post.comments.create(content: 'A comment')
        post.comments.create(content: 'Another comment')
      }.to change(post.comments, :count).by(2)

      # Delete comments
      post.comments.delete_all
      post.comments.count.should == 0
    end
  end
=======
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

>>>>>>> stripe
end
