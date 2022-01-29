# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PathwaysController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pathways').to route_to('pathways#index')
    end

    it 'routes to #new' do
      expect(get: '/pathways/new').to route_to('pathways#new')
    end

    it 'routes to #show' do
      expect(get: '/pathways/1').to route_to('pathways#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/pathways/1/edit').to route_to('pathways#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pathways').to route_to('pathways#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pathways/1').to route_to('pathways#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pathways/1').to route_to('pathways#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pathways/1').to route_to('pathways#destroy', id: '1')
    end
  end
end
