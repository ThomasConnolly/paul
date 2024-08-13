# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/railties/all/railties.rbi
#
# railties-7.1.3.4

module Rails
  def self.app_class; end
  def self.app_class=(arg0); end
  def self.application; end
  def self.application=(arg0); end
  def self.autoloaders; end
  def self.backtrace_cleaner; end
  def self.cache; end
  def self.cache=(arg0); end
  def self.configuration; end
  def self.deprecator; end
  def self.env; end
  def self.env=(environment); end
  def self.error; end
  def self.gem_version; end
  def self.groups(*groups); end
  def self.initialize!(*, **, &); end
  def self.initialized?(*, **, &); end
  def self.logger; end
  def self.logger=(arg0); end
  def self.public_path; end
  def self.root; end
  def self.version; end
  extend ActiveSupport::Autoload
  extend ActiveSupport::Benchmarkable
end
module Rails::VERSION
end
module Rails::Initializable
  def initializers; end
  def run_initializers(group = nil, *args); end
  def self.included(base); end
end
class Rails::Initializable::Initializer
  def after; end
  def before; end
  def belongs_to?(group); end
  def bind(context); end
  def block; end
  def context_class; end
  def initialize(name, context, options, &block); end
  def name; end
  def run(*args); end
end
class Rails::Initializable::Collection < Array
  def +(other); end
  def tsort_each_child(initializer, &block); end
  def tsort_each_node; end
  include TSort
end
module Rails::Initializable::ClassMethods
  def initializer(name, opts = nil, &blk); end
  def initializers; end
  def initializers_chain; end
  def initializers_for(binding); end
end
class Rails::Railtie
  def config; end
  def configure(&block); end
  def each_registered_block(type, &block); end
  def initialize; end
  def inspect; end
  def railtie_name(*, **, &); end
  def railtie_namespace; end
  def run_console_blocks(app); end
  def run_generators_blocks(app); end
  def run_runner_blocks(app); end
  def run_server_blocks(app); end
  def run_tasks_blocks(app); end
  def self.<=>(other); end
  def self.abstract_railtie?; end
  def self.config(*, **, &); end
  def self.configure(&block); end
  def self.console(&blk); end
  def self.generate_railtie_name(string); end
  def self.generators(&blk); end
  def self.increment_load_index; end
  def self.inherited(subclass); end
  def self.instance; end
  def self.load_index; end
  def self.method_missing(name, *args, **, &block); end
  def self.new(*, **); end
  def self.railtie_name(name = nil); end
  def self.rake_tasks(&blk); end
  def self.register_block_for(type, &blk); end
  def self.respond_to_missing?(name, _); end
  def self.runner(&blk); end
  def self.server(&blk); end
  def self.subclasses; end
  extend ActiveSupport::DescendantsTracker
  extend Rails::Initializable::ClassMethods
  include Rails::Initializable
end
class Rails::Engine < Rails::Railtie
  def __callbacks; end
  def __callbacks?; end
  def _all_autoload_once_paths; end
  def _all_autoload_paths; end
  def _all_load_paths(add_autoload_paths_to_load_path); end
  def _load_seed_callbacks; end
  def _run_load_seed_callbacks(&block); end
  def app; end
  def build_middleware; end
  def build_request(env); end
  def call(env); end
  def config; end
  def default_middleware_stack; end
  def eager_load!; end
  def endpoint; end
  def engine_name(*, **, &); end
  def env_config; end
  def fixtures_in_root_and_not_in_vendor?(fixtures); end
  def has_migrations?; end
  def helpers; end
  def helpers_paths; end
  def initialize; end
  def isolated?(&block); end
  def load_config_initializer(initializer); end
  def load_console(app = nil); end
  def load_generators(app = nil); end
  def load_runner(app = nil); end
  def load_seed; end
  def load_server(app = nil); end
  def load_tasks(app = nil); end
  def middleware(*, **, &); end
  def paths(*, **, &); end
  def railties; end
  def root(*, **, &); end
  def routes(&block); end
  def routes?; end
  def run_tasks_blocks(*); end
  def self.__callbacks; end
  def self.__callbacks=(value); end
  def self.__callbacks?; end
  def self._load_seed_callbacks; end
  def self._load_seed_callbacks=(value); end
  def self.called_from; end
  def self.called_from=(arg0); end
  def self.eager_load!(*, **, &); end
  def self.endpoint(endpoint = nil); end
  def self.engine_name(name = nil); end
  def self.find(path); end
  def self.find_root(from); end
  def self.find_root_with_flag(flag, root_path, default = nil); end
  def self.inherited(base); end
  def self.isolate_namespace(mod); end
  def self.isolated; end
  def self.isolated=(arg0); end
  def self.isolated?; end
  extend ActiveSupport::Callbacks::ClassMethods
  extend ActiveSupport::DescendantsTracker
  include ActiveSupport::Callbacks
end
class Rails::Engine::Railties
  def -(others); end
  def _all; end
  def each(*args, &block); end
  def initialize; end
  include Enumerable
end
class Rails::Secrets
  def self.decrypt(data); end
  def self.encrypt(data); end
  def self.encryptor; end
  def self.handle_missing_key; end
  def self.key; end
  def self.key_path; end
  def self.parse(paths, env:); end
  def self.path; end
  def self.preprocess(path); end
  def self.read; end
  def self.read_for_editing(&block); end
  def self.read_key_file; end
  def self.root=(arg0); end
  def self.write(contents); end
  def self.writing(contents); end
end
class Rails::Secrets::MissingKeyError < RuntimeError
  def initialize; end
end
class Rails::Autoloaders
  def each; end
  def initialize; end
  def log!; end
  def logger=(logger); end
  def main; end
  def once; end
  def zeitwerk_enabled?; end
  include Enumerable
end
module Rails::Autoloaders::Inflector
  def self.camelize(basename, _abspath); end
  def self.inflect(overrides); end
end
class Rails::Application < Rails::Engine
  def assets; end
  def assets=(arg0); end
  def autoloaders; end
  def build_middleware; end
  def build_middleware_stack; end
  def build_request(env); end
  def coerce_same_site_protection(protection); end
  def config; end
  def config=(arg0); end
  def config_for(name, env: nil); end
  def console(&blk); end
  def credentials; end
  def credentials=(arg0); end
  def default_middleware_stack; end
  def default_url_options(*, **, &); end
  def default_url_options=(arg); end
  def deprecators; end
  def eager_load!; end
  def encrypted(path, key_path: nil, env_key: nil); end
  def ensure_generator_templates_added; end
  def env_config; end
  def executor; end
  def filter_parameters; end
  def generate_local_secret; end
  def generators(&blk); end
  def helpers_paths; end
  def initialize!(group = nil); end
  def initialize(initial_variable_values = nil, &block); end
  def initialized?; end
  def initializer(name, opts = nil, &block); end
  def initializers; end
  def isolate_namespace(mod); end
  def key_generator(secret_key_base = nil); end
  def load_generators(app = nil); end
  def message_verifier(verifier_name); end
  def message_verifiers; end
  def migration_railties; end
  def ordered_railties; end
  def railties_initializers(current); end
  def rake_tasks(&block); end
  def reload_routes!; end
  def reloader; end
  def reloaders; end
  def require_environment!; end
  def routes_reloader; end
  def run_console_blocks(app); end
  def run_generators_blocks(app); end
  def run_load_hooks!; end
  def run_runner_blocks(app); end
  def run_server_blocks(app); end
  def run_tasks_blocks(app); end
  def runner(&blk); end
  def sandbox; end
  def sandbox=(arg0); end
  def sandbox?; end
  def secret_key_base; end
  def secrets; end
  def secrets=(arg0); end
  def secrets_secret_key_base; end
  def self.add_lib_to_load_path!(root); end
  def self.create(initial_variable_values = nil, &block); end
  def self.find_root(from); end
  def self.inherited(base); end
  def self.instance; end
  def self.new(*, **); end
  def server(&blk); end
  def to_app; end
  def validate_secret_key_base(secret_key_base); end
  def watchable_args; end
end
class Rails::BacktraceCleaner < ActiveSupport::BacktraceCleaner
  def initialize; end
end
module Rails::Paths
end
class Rails::Paths::Root
  def [](path); end
  def []=(path, value); end
  def add(path, options = nil); end
  def all_paths; end
  def autoload_once; end
  def autoload_paths; end
  def eager_load; end
  def filter_by(&block); end
  def initialize(path); end
  def keys; end
  def load_paths; end
  def path; end
  def path=(arg0); end
  def values; end
  def values_at(*list); end
end
class Rails::Paths::Path
  def <<(path); end
  def absolute_current; end
  def autoload!; end
  def autoload?; end
  def autoload_once!; end
  def autoload_once?; end
  def children; end
  def concat(paths); end
  def each(&block); end
  def eager_load!; end
  def eager_load?; end
  def existent; end
  def existent_directories; end
  def expanded; end
  def extensions; end
  def files_in(path); end
  def first; end
  def glob; end
  def glob=(arg0); end
  def initialize(root, current, paths, options = nil); end
  def last; end
  def load_path!; end
  def load_path?; end
  def paths; end
  def push(path); end
  def skip_autoload!; end
  def skip_autoload_once!; end
  def skip_eager_load!; end
  def skip_load_path!; end
  def to_a; end
  def to_ary; end
  def unshift(*paths); end
  include Enumerable
end
module Rails::Rack
end
module Rails::Configuration
end
class Rails::Configuration::MiddlewareStackProxy
  def +(other); end
  def delete(*, **, &); end
  def delete_operations; end
  def initialize(operations = nil, delete_operations = nil); end
  def insert(*, **, &); end
  def insert_after(*, **, &); end
  def insert_before(*, **, &); end
  def merge_into(other); end
  def move(*, **, &); end
  def move_after(*, **, &); end
  def move_before(*, **, &); end
  def operations; end
  def swap(*, **, &); end
  def unshift(*, **, &); end
  def use(*, **, &); end
end
class Rails::Configuration::Generators
  def after_generate(&block); end
  def after_generate_callbacks; end
  def aliases; end
  def aliases=(arg0); end
  def api_only; end
  def api_only=(arg0); end
  def colorize_logging; end
  def colorize_logging=(arg0); end
  def fallbacks; end
  def fallbacks=(arg0); end
  def hidden_namespaces; end
  def hide_namespace(namespace); end
  def initialize; end
  def initialize_copy(source); end
  def method_missing(method, *args); end
  def options; end
  def options=(arg0); end
  def templates; end
  def templates=(arg0); end
end
class Rails::Railtie::Configuration
  def actual_method?(key); end
  def after_initialize(&block); end
  def after_routes_loaded(&block); end
  def app_generators; end
  def app_middleware; end
  def before_configuration(&block); end
  def before_eager_load(&block); end
  def before_initialize(&block); end
  def eager_load_namespaces; end
  def initialize; end
  def method_missing(name, *args, &blk); end
  def respond_to?(name, include_private = nil); end
  def self.eager_load_namespaces; end
  def to_prepare(&blk); end
  def to_prepare_blocks; end
  def watchable_dirs; end
  def watchable_files; end
end
class Rails::Engine::Configuration < Rails::Railtie::Configuration
  def all_autoload_once_paths; end
  def all_autoload_paths; end
  def all_eager_load_paths; end
  def autoload_once_paths; end
  def autoload_once_paths=(arg0); end
  def autoload_paths; end
  def autoload_paths=(arg0); end
  def eager_load_paths; end
  def eager_load_paths=(arg0); end
  def generators; end
  def initialize(root = nil); end
  def javascript_path; end
  def javascript_path=(arg0); end
  def middleware; end
  def middleware=(arg0); end
  def paths; end
  def root; end
  def root=(value); end
end
class Rails::SourceAnnotationExtractor
end
class Rails::SourceAnnotationExtractor::ParserExtractor < Anonymous_Struct_5
end
class Rails::SourceAnnotationExtractor::ParserExtractor::Parser < Ripper
end
class Rails::SourceAnnotationExtractor::PatternExtractor < Anonymous_Struct_6
end
class Rails::SourceAnnotationExtractor::Annotation < Anonymous_Struct_7
end
class Rails::Application::Configuration < Rails::Engine::Configuration
end
class Rails::Application::Configuration::Custom
end
module Rails::Application::Bootstrap
  extend Rails::Initializable::ClassMethods
  include Rails::Initializable
end
module Rails::Application::Finisher
  extend Rails::Initializable::ClassMethods
  include Rails::Initializable
end
class Rails::Application::Finisher::MonitorHook
end
module Rails::Application::Finisher::InterlockHook
end
class Rails::Rack::Logger < ActiveSupport::LogSubscriber
end
class Rails::Application::RoutesReloader
  extend ActiveSupport::Callbacks::ClassMethods
  extend ActiveSupport::DescendantsTracker
  include ActiveSupport::Callbacks
end
class Rails::Application::DefaultMiddlewareStack
end
