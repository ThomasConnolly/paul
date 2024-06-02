# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/activestorage/all/activestorage.rbi
#
# activestorage-7.1.3.2

module ActiveStorage
  def analyzers; end
  def analyzers=(val); end
  def binary_content_type; end
  def binary_content_type=(val); end
  def content_types_allowed_inline; end
  def content_types_allowed_inline=(val); end
  def content_types_to_serve_as_binary; end
  def content_types_to_serve_as_binary=(val); end
  def draw_routes; end
  def draw_routes=(val); end
  def logger; end
  def logger=(val); end
  def paths; end
  def paths=(val); end
  def previewers; end
  def previewers=(val); end
  def queues; end
  def queues=(val); end
  def resolve_model_to_route; end
  def resolve_model_to_route=(val); end
  def routes_prefix; end
  def routes_prefix=(val); end
  def self.analyzers; end
  def self.analyzers=(val); end
  def self.binary_content_type; end
  def self.binary_content_type=(val); end
  def self.content_types_allowed_inline; end
  def self.content_types_allowed_inline=(val); end
  def self.content_types_to_serve_as_binary; end
  def self.content_types_to_serve_as_binary=(val); end
  def self.deprecator; end
  def self.draw_routes; end
  def self.draw_routes=(val); end
  def self.gem_version; end
  def self.logger; end
  def self.logger=(val); end
  def self.paths; end
  def self.paths=(val); end
  def self.previewers; end
  def self.previewers=(val); end
  def self.queues; end
  def self.queues=(val); end
  def self.railtie_helpers_paths; end
  def self.railtie_namespace; end
  def self.railtie_routes_url_helpers(include_path_helpers = nil); end
  def self.replace_on_assign_to_many; end
  def self.replace_on_assign_to_many=(value); end
  def self.resolve_model_to_route; end
  def self.resolve_model_to_route=(val); end
  def self.routes_prefix; end
  def self.routes_prefix=(val); end
  def self.service_urls_expire_in; end
  def self.service_urls_expire_in=(val); end
  def self.silence_invalid_content_types_warning; end
  def self.silence_invalid_content_types_warning=(value); end
  def self.supported_image_processing_methods; end
  def self.supported_image_processing_methods=(val); end
  def self.table_name_prefix; end
  def self.track_variants; end
  def self.track_variants=(val); end
  def self.unsupported_image_processing_arguments; end
  def self.unsupported_image_processing_arguments=(val); end
  def self.urls_expire_in; end
  def self.urls_expire_in=(val); end
  def self.use_relative_model_naming?; end
  def self.variable_content_types; end
  def self.variable_content_types=(val); end
  def self.variant_processor; end
  def self.variant_processor=(val); end
  def self.verifier; end
  def self.verifier=(val); end
  def self.version; end
  def self.video_preview_arguments; end
  def self.video_preview_arguments=(val); end
  def self.web_image_content_types; end
  def self.web_image_content_types=(val); end
  def service_urls_expire_in; end
  def service_urls_expire_in=(val); end
  def supported_image_processing_methods; end
  def supported_image_processing_methods=(val); end
  def track_variants; end
  def track_variants=(val); end
  def unsupported_image_processing_arguments; end
  def unsupported_image_processing_arguments=(val); end
  def urls_expire_in; end
  def urls_expire_in=(val); end
  def variable_content_types; end
  def variable_content_types=(val); end
  def variant_processor; end
  def variant_processor=(val); end
  def verifier; end
  def verifier=(val); end
  def video_preview_arguments; end
  def video_preview_arguments=(val); end
  def web_image_content_types; end
  def web_image_content_types=(val); end
  extend ActiveSupport::Autoload
end
module ActiveStorage::VERSION
end
class ActiveStorage::Error < StandardError
end
class ActiveStorage::InvariableError < ActiveStorage::Error
end
class ActiveStorage::UnpreviewableError < ActiveStorage::Error
end
class ActiveStorage::UnrepresentableError < ActiveStorage::Error
end
class ActiveStorage::IntegrityError < ActiveStorage::Error
end
class ActiveStorage::FileNotFoundError < ActiveStorage::Error
end
class ActiveStorage::PreviewError < ActiveStorage::Error
end
module ActiveStorage::Transformers
  extend ActiveSupport::Autoload
end
class ActiveStorage::Previewer
  def blob; end
  def capture(*argv, to:); end
  def download_blob_to_tempfile(&block); end
  def draw(*argv); end
  def initialize(blob); end
  def instrument(operation, payload = nil, &block); end
  def logger; end
  def open_tempfile; end
  def preview(**options); end
  def self.accept?(blob); end
  def service_name; end
  def tmpdir; end
end
class ActiveStorage::Previewer::PopplerPDFPreviewer < ActiveStorage::Previewer
  def draw_first_page_from(file, &block); end
  def preview(**options); end
  def self.accept?(blob); end
  def self.pdftoppm_exists?; end
  def self.pdftoppm_path; end
end
class ActiveStorage::Previewer::MuPDFPreviewer < ActiveStorage::Previewer
  def draw_first_page_from(file, &block); end
  def preview(**options); end
  def self.accept?(blob); end
  def self.mutool_exists?; end
  def self.mutool_path; end
end
class ActiveStorage::Previewer::VideoPreviewer < ActiveStorage::Previewer
  def draw_relevant_frame_from(file, &block); end
  def preview(**options); end
  def self.accept?(blob); end
  def self.ffmpeg_exists?; end
  def self.ffmpeg_path; end
end
class ActiveStorage::Analyzer
  def blob; end
  def download_blob_to_tempfile(&block); end
  def initialize(blob); end
  def instrument(analyzer, &block); end
  def logger; end
  def metadata; end
  def self.accept?(blob); end
  def self.analyze_later?; end
  def tmpdir; end
end
class ActiveStorage::Analyzer::ImageAnalyzer < ActiveStorage::Analyzer
  def metadata; end
  def self.accept?(blob); end
end
class ActiveStorage::Analyzer::ImageAnalyzer::ImageMagick < ActiveStorage::Analyzer::ImageAnalyzer
  def read_image; end
  def rotated_image?(image); end
  def self.accept?(blob); end
end
class ActiveStorage::Analyzer::ImageAnalyzer::Vips < ActiveStorage::Analyzer::ImageAnalyzer
  def read_image; end
  def rotated_image?(image); end
  def self.accept?(blob); end
  def valid_image?(image); end
end
class ActiveStorage::Analyzer::VideoAnalyzer < ActiveStorage::Analyzer
  def angle; end
  def audio?; end
  def audio_stream; end
  def computed_height; end
  def container; end
  def display_aspect_ratio; end
  def display_height_scale; end
  def duration; end
  def encoded_height; end
  def encoded_width; end
  def ffprobe_path; end
  def height; end
  def metadata; end
  def probe; end
  def probe_from(file); end
  def rotated?; end
  def self.accept?(blob); end
  def side_data; end
  def streams; end
  def tags; end
  def video?; end
  def video_stream; end
  def width; end
end
class ActiveStorage::Analyzer::AudioAnalyzer < ActiveStorage::Analyzer
  def audio_stream; end
  def bit_rate; end
  def duration; end
  def ffprobe_path; end
  def metadata; end
  def probe; end
  def probe_from(file); end
  def sample_rate; end
  def self.accept?(blob); end
  def streams; end
  def tags; end
end
class ActiveStorage::LogSubscriber < ActiveSupport::LogSubscriber
  def self.log_levels; end
end
class ActiveStorage::Downloader
  def download(key, file); end
  def initialize(service); end
  def open(key, checksum: nil, verify: nil, name: nil, tmpdir: nil); end
  def open_tempfile(name, tmpdir = nil); end
  def service; end
  def verify_integrity_of(file, checksum:); end
end
class ActiveStorage::Service
  def compose(source_keys, destination_key, filename: nil, content_type: nil, disposition: nil, custom_metadata: nil); end
  def content_disposition_with(filename:, type: nil); end
  def custom_metadata_headers(metadata); end
  def delete(key); end
  def delete_prefixed(prefix); end
  def download(key); end
  def download_chunk(key, range); end
  def exist?(key); end
  def headers_for_direct_upload(key, filename:, content_type:, content_length:, checksum:, custom_metadata: nil); end
  def instrument(operation, payload = nil, &block); end
  def name; end
  def name=(arg0); end
  def open(*args, **options, &block); end
  def private_url(key, expires_in:, filename:, disposition:, content_type:, **); end
  def public?; end
  def public_url(key, **); end
  def self.build(configurator:, name:, service: nil, **service_config); end
  def self.configure(service_name, configurations); end
  def service_name; end
  def update_metadata(key, **metadata); end
  def upload(key, io, checksum: nil, **options); end
  def url(key, **options); end
  def url_for_direct_upload(key, expires_in:, content_type:, content_length:, checksum:, custom_metadata: nil); end
  extend ActiveSupport::Autoload
end
class ActiveStorage::Service::Registry
  def configurations; end
  def configurator; end
  def fetch(name); end
  def initialize(configurations); end
  def services; end
end
module ActiveStorage::Reflection
end
class ActiveStorage::Reflection::HasAttachedReflection < ActiveRecord::Reflection::MacroReflection
  def named_variants; end
  def variant(name, transformations); end
end
class ActiveStorage::Reflection::HasOneAttachedReflection < ActiveStorage::Reflection::HasAttachedReflection
  def macro; end
end
class ActiveStorage::Reflection::HasManyAttachedReflection < ActiveStorage::Reflection::HasAttachedReflection
  def macro; end
end
module ActiveStorage::Reflection::ReflectionExtension
  def add_attachment_reflection(model, name, reflection); end
  def reflection_class_for(macro); end
end
module ActiveStorage::Reflection::ActiveRecordExtensions
  extend ActiveSupport::Concern
end
module ActiveStorage::Reflection::ActiveRecordExtensions::ClassMethods
  def reflect_on_all_attachments; end
  def reflect_on_attachment(attachment); end
end
class ActiveStorage::Engine < Rails::Engine
end
module Anonymous_Module_31
end
module Anonymous_Module_32
end
module ActiveStorage::Attached::Model
  extend ActiveSupport::Concern
end
module ActiveStorage::Attached::Model::ClassMethods
end
class ActiveStorage::Attached::One < ActiveStorage::Attached
end
class ActiveStorage::Attached::Many < ActiveStorage::Attached
end
module ActiveStorage::Attached::Changes
  extend ActiveSupport::Autoload
end
class ActiveStorage::Attached
end
class ActiveStorage::Record::ActiveRecord_Relation < ActiveRecord::Relation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Base::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Record::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Base::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Record::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Base::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Record::ActiveRecord_DisableJoinsAssociationRelation < ActiveRecord::DisableJoinsAssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Base::GeneratedRelationMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Record::GeneratedAttributeMethods
end
class ActiveStorage::Record < ActiveRecord::Base
  include ActiveStorage::Record::GeneratedAssociationMethods
  include ActiveStorage::Record::GeneratedAttributeMethods
end
module ActiveStorage::Record::GeneratedAssociationMethods
end
class ActiveStorage::Analyzer::NullAnalyzer < ActiveStorage::Analyzer
end
module ActiveStorage::Blob::Analyzable
end
module ActiveStorage::Blob::Identifiable
end
module ActiveStorage::Blob::Representable
  extend ActiveSupport::Concern
end
module ActiveStorage::Blob::Servable
end
class ActiveStorage::Service::Configurator
end
class ActiveStorage::Blob::ActiveRecord_Relation < ActiveRecord::Relation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Blob::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Blob::GeneratedRelationMethods
end
class ActiveStorage::Blob::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Blob::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Blob::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Blob::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Blob::ActiveRecord_DisableJoinsAssociationRelation < ActiveRecord::DisableJoinsAssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Blob::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Blob::GeneratedAttributeMethods
end
class ActiveStorage::Blob < ActiveStorage::Record
  extend ActionText::Attachable::ClassMethods
  include ActionText::Attachable
  include ActiveStorage::Blob::Analyzable
  include ActiveStorage::Blob::GeneratedAssociationMethods
  include ActiveStorage::Blob::GeneratedAttributeMethods
  include ActiveStorage::Blob::Identifiable
  include ActiveStorage::Blob::Representable
  include ActiveStorage::Blob::Servable
  include Anonymous_Module_33
end
module ActiveStorage::Blob::GeneratedAssociationMethods
end
module Anonymous_Module_33
end
module ActiveStorage::SetCurrent
  extend ActiveSupport::Concern
end
module Anonymous_Module_34
  extend ActiveSupport::Concern
  extend Anonymous_Module_31
  extend Anonymous_Module_32
  include ActionDispatch::Routing::UrlFor
  include Anonymous_Module_31
  include Anonymous_Module_32
end
class ActiveStorage::BaseController < ActionController::Base
  include ActionDispatch::Routing::UrlFor
  include ActiveStorage::SetCurrent
  include Anonymous_Module_34
end
class ActiveStorage::DirectUploadsController < ActiveStorage::BaseController
  include Anonymous_Module_34
end
module ActiveStorage::FileServer
end
class ActiveStorage::DiskController < ActiveStorage::BaseController
  include ActiveStorage::FileServer
  include Anonymous_Module_34
end
module ActiveStorage::SetBlob
  extend ActiveSupport::Concern
end
module ActiveStorage::Streaming
  extend ActiveSupport::Concern
  include ActionController::DataStreaming
  include ActionController::Live
end
module ActiveStorage::DisableSession
  extend ActiveSupport::Concern
end
class ActiveStorage::Blobs::ProxyController < ActiveStorage::BaseController
  extend ActionController::Live::ClassMethods
  include ActionController::DataStreaming
  include ActionController::Live
  include ActiveStorage::DisableSession
  include ActiveStorage::SetBlob
  include ActiveStorage::Streaming
  include Anonymous_Module_34
end
class ActiveStorage::Blobs::RedirectController < ActiveStorage::BaseController
  include ActiveStorage::SetBlob
  include Anonymous_Module_34
end
class ActiveStorage::Representations::BaseController < ActiveStorage::BaseController
  include ActiveStorage::SetBlob
  include Anonymous_Module_34
end
class ActiveStorage::Representations::ProxyController < ActiveStorage::Representations::BaseController
  extend ActionController::Live::ClassMethods
  include ActionController::DataStreaming
  include ActionController::Live
  include ActiveStorage::DisableSession
  include ActiveStorage::Streaming
  include Anonymous_Module_34
end
class ActiveStorage::Representations::RedirectController < ActiveStorage::Representations::BaseController
  include Anonymous_Module_34
end
class ActiveStorage::BaseJob < ActiveJob::Base
end
class ActiveStorage::AnalyzeJob < ActiveStorage::BaseJob
end
class ActiveStorage::MirrorJob < ActiveStorage::BaseJob
end
class ActiveStorage::PurgeJob < ActiveStorage::BaseJob
end
class ActiveStorage::TransformJob < ActiveStorage::BaseJob
end
class ActiveStorage::Attachment::ActiveRecord_Relation < ActiveRecord::Relation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Attachment::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Attachment::GeneratedRelationMethods
end
class ActiveStorage::Attachment::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Attachment::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Attachment::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Attachment::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
class ActiveStorage::Attachment::ActiveRecord_DisableJoinsAssociationRelation < ActiveRecord::DisableJoinsAssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Attachment::GeneratedRelationMethods
  include ActiveStorage::Record::GeneratedRelationMethods
end
module ActiveStorage::Attachment::GeneratedAttributeMethods
end
class ActiveStorage::Attachment < ActiveStorage::Record
  include ActiveStorage::Attachment::GeneratedAssociationMethods
  include ActiveStorage::Attachment::GeneratedAttributeMethods
end
module ActiveStorage::Attachment::GeneratedAssociationMethods
end
class ActiveStorage::Current < ActiveSupport::CurrentAttributes
  include Anonymous_Module_35
end
module Anonymous_Module_35
end
class ActiveStorage::Filename
  include Comparable
end
class ActiveStorage::NamedVariant
end
class ActiveStorage::Preview
  include ActiveStorage::Blob::Servable
end
class ActiveStorage::Preview::UnprocessedError < StandardError
end
class ActiveStorage::Variant
  include ActiveStorage::Blob::Servable
end
class ActiveStorage::VariantRecord::ActiveRecord_Relation < ActiveRecord::Relation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
  include ActiveStorage::VariantRecord::GeneratedRelationMethods
end
module ActiveStorage::VariantRecord::GeneratedRelationMethods
end
class ActiveStorage::VariantRecord::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
  include ActiveStorage::VariantRecord::GeneratedRelationMethods
end
class ActiveStorage::VariantRecord::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
  include ActiveStorage::VariantRecord::GeneratedRelationMethods
end
class ActiveStorage::VariantRecord::ActiveRecord_DisableJoinsAssociationRelation < ActiveRecord::DisableJoinsAssociationRelation
  extend ActiveRecord::Delegation::ClassSpecificRelation::ClassMethods
  include ActiveRecord::Delegation::ClassSpecificRelation
  include ActiveStorage::Record::GeneratedRelationMethods
  include ActiveStorage::VariantRecord::GeneratedRelationMethods
end
module ActiveStorage::VariantRecord::GeneratedAttributeMethods
end
class ActiveStorage::VariantRecord < ActiveStorage::Record
  include ActiveStorage::VariantRecord::GeneratedAssociationMethods
  include ActiveStorage::VariantRecord::GeneratedAttributeMethods
end
module ActiveStorage::VariantRecord::GeneratedAssociationMethods
end
class ActiveStorage::VariantWithRecord
  include ActiveStorage::Blob::Servable
end
class ActiveStorage::Variation
end
class ActiveStorage::FixtureSet
  extend ActiveRecord::SecureToken::ClassMethods
  include ActiveRecord::SecureToken
  include ActiveSupport::Testing::FileFixtures
end
class ActiveStorage::Attached::Changes::CreateOne
end
class ActiveStorage::Attached::Changes::CreateMany
end
class ActiveStorage::Attached::Changes::CreateOneOfMany < ActiveStorage::Attached::Changes::CreateOne
end
class ActiveStorage::Attached::Changes::DeleteOne
end
class ActiveStorage::Attached::Changes::DeleteMany
end
class ActiveStorage::Transformers::Transformer
end
class ActiveStorage::Transformers::ImageProcessingTransformer < ActiveStorage::Transformers::Transformer
end
class ActiveStorage::Transformers::ImageProcessingTransformer::UnsupportedImageProcessingMethod < StandardError
end
class ActiveStorage::Transformers::ImageProcessingTransformer::UnsupportedImageProcessingArgument < StandardError
end
