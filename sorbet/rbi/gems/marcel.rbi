# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/marcel/all/marcel.rbi
#
# marcel-1.0.4

module Marcel
end
class Marcel::Magic
  def ==(other); end
  def audio?; end
  def child_of?(parent); end
  def comment; end
  def eql?(other); end
  def extensions; end
  def hash; end
  def image?; end
  def initialize(type); end
  def mediatype; end
  def self.add(type, options); end
  def self.all_by_magic(io); end
  def self.by_extension(ext); end
  def self.by_magic(io); end
  def self.by_path(path); end
  def self.child?(child, parent); end
  def self.magic_match(io, method); end
  def self.magic_match_io(io, matches, buffer); end
  def self.remove(type); end
  def subtype; end
  def text?; end
  def to_s; end
  def type; end
  def video?; end
end
class Marcel::MimeType
  def self.extend(type, extensions: nil, parents: nil, magic: nil); end
  def self.for(pathname_or_io = nil, name: nil, extension: nil, declared_type: nil); end
  def self.for_data(pathname_or_io); end
  def self.for_declared_type(declared_type); end
  def self.for_extension(extension); end
  def self.for_name(name); end
  def self.most_specific_type(*candidates); end
  def self.parse_media_type(content_type); end
  def self.with_io(pathname_or_io, &block); end
end
