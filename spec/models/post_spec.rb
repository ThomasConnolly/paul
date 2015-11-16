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
end
