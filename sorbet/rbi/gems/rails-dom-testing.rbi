# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rails-dom-testing/all/rails-dom-testing.rbi
#
# rails-dom-testing-2.2.0

module Rails
end
module Rails::Dom
end
module Rails::Dom::Testing
end
module Rails::Dom::Testing::Assertions
  include Rails::Dom::Testing::Assertions::DomAssertions
  include Rails::Dom::Testing::Assertions::SelectorAssertions
end
module Rails::Dom::Testing::Assertions::DomAssertions
end
module Rails::Dom::Testing::Assertions::SelectorAssertions
end
class Rails::Dom::Testing::Assertions::SelectorAssertions::SubstitutionContext
end
class Rails::Dom::Testing::Assertions::SelectorAssertions::HTMLSelector
  include Minitest::Assertions
end
class Rails::Dom::Testing::Railtie < Rails::Railtie
end
