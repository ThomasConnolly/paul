# == Schema Information
#
# Table name: story_ideas
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "StoryIdeas", type: :request do
  describe "GET /story_ideas" do
    it "works! (now write some real specs)" do
      get story_ideas_path
      expect(response).to have_http_status(200)
    end
  end
end
