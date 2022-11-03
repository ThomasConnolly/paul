require 'rails_helper'

RSpec.describe StoryAssignmentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/story_assignments').to route_to('story_assignments#index')
    end

    it 'routes to #new' do
      expect(get: '/story_assignments/new').to route_to('story_assignments#new')
    end

    it 'routes to #show' do
      expect(get: '/story_assignments/1').to route_to('story_assignments#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/story_assignments/1/edit').to route_to('story_assignments#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/story_assignments').to route_to('story_assignments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/story_assignments/1').to route_to('story_assignments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/story_assignments/1').to route_to('story_assignments#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/story_assignments/1').to route_to('story_assignments#destroy', id: '1')
    end
  end
end
