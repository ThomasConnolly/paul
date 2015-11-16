# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do  
  describe :post do
    it 'should return the post object' do
      post = Post.create(title: 'A post', content: 'Indeed it is.')
      comment = post.comments.create(content: 'YAY COMMENT')

      comment.commentable.should == post
    end
  end
end  
