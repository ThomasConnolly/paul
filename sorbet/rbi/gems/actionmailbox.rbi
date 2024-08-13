# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/actionmailbox/all/actionmailbox.rbi
#
# actionmailbox-7.1.3.4

module ActionMailbox
  extend ActiveSupport::Autoload
end
module ActionMailbox::VERSION
end
module Mail
end
class Mail::Address
end
class Mail::Message
end
class ActionMailbox::Engine < Rails::Engine
end
module ActionMailbox::Callbacks
  extend ActiveSupport::Concern
  include ActiveSupport::Callbacks
end
module ActionMailbox::Callbacks::ClassMethods
end
module ActionMailbox::Routing
  extend ActiveSupport::Concern
end
module ActionMailbox::Routing::ClassMethods
end
class ActionMailbox::Router::Route
end
class ActionMailbox::Router
end
class ActionMailbox::Router::RoutingError < StandardError
end
class ActionMailbox::Base
  extend ActionMailbox::Callbacks::ClassMethods
  extend ActionMailbox::Routing::ClassMethods
  extend ActiveSupport::Callbacks::ClassMethods
  extend ActiveSupport::DescendantsTracker
  extend ActiveSupport::Rescuable::ClassMethods
  include ActionMailbox::Callbacks
  include ActiveSupport::Callbacks
  include ActiveSupport::Rescuable
end
module ActionMailbox::TestHelper
end
class ActionMailbox::TestCase < ActiveSupport::TestCase
  include ActionMailbox::TestHelper
end
