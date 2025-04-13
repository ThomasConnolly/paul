module PropshaftHelper
    def self.find_root
      Rails.root
    end
  end
  
  # Monkey patch Propshaft's compiler
  Rails.application.config.to_prepare do
    if defined?(Propshaft::Compiler)
      Propshaft::Compiler.class_eval do
        alias_method :original_initialize, :initialize
        
        def initialize(resolver, output_path)
          @resolver = resolver
          @output_path = output_path
          @manifest = Propshaft::Manifest.new(PropshaftHelper.find_root.join("public/assets/.manifest.json"))
        end
      end
    end
  end