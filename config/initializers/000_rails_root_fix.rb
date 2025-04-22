# frozen_string_literal: true

# Comprehensive fix for Propshaft 'undefined method root for nil' error
require 'pathname'

# First, ensure Rails.root is available
unless defined?(Rails.root)
  module Rails
    def self.root
      @root ||= Pathname.new(File.expand_path('../..', __dir__))
    end
  end
end

# Ensure Rails.application exists and has a config
Rails.application unless defined?(Rails.application)

# Ensure Rails.application is properly defined
unless defined?(Rails.application) || Rails.application.nil?