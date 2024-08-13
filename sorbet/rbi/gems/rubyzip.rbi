# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rubyzip/all/rubyzip.rbi
#
# rubyzip-2.3.2

module Zip
  extend Zip
end
class Zip::DOSTime < Time
end
module Zip::IOExtras
end
module Zip::IOExtras::AbstractInputStream
  include Enumerable
  include Zip::IOExtras::FakeIO
end
module Zip::IOExtras::AbstractOutputStream
  include Zip::IOExtras::FakeIO
end
module Zip::IOExtras::FakeIO
end
class Zip::Entry
end
class Zip::ExtraField::Generic
end
class Zip::ExtraField::UniversalTime < Zip::ExtraField::Generic
end
class Zip::ExtraField::OldUnix < Zip::ExtraField::Generic
end
class Zip::ExtraField::IUnix < Zip::ExtraField::Generic
end
class Zip::ExtraField::Zip64 < Zip::ExtraField::Generic
end
class Zip::ExtraField::Zip64Placeholder < Zip::ExtraField::Generic
end
class Zip::ExtraField::NTFS < Zip::ExtraField::Generic
end
class Zip::ExtraField < Hash
end
class Zip::EntrySet
  include Enumerable
end
class Zip::CentralDirectory
  include Enumerable
end
class Zip::File < Zip::CentralDirectory
  include Zip::FileSystem
end
class Zip::InputStream
  include Zip::IOExtras::AbstractInputStream
end
class Zip::OutputStream
  include Zip::IOExtras::AbstractOutputStream
end
class Zip::Decompressor
end
class Zip::Compressor
end
module Zip::NullDecompressor
end
class Zip::NullCompressor < Zip::Compressor
  extend Singleton::SingletonClassMethods
  include Singleton
end
module Zip::NullInputStream
  include Zip::IOExtras::AbstractInputStream
  include Zip::NullDecompressor
end
class Zip::PassThruCompressor < Zip::Compressor
end
class Zip::PassThruDecompressor < Zip::Decompressor
end
class Zip::DecryptedIo
end
class Zip::Encrypter
end
class Zip::Decrypter
end
module Zip::NullEncryption
end
class Zip::NullEncrypter < Zip::Encrypter
  include Zip::NullEncryption
end
class Zip::NullDecrypter < Zip::Decrypter
  include Zip::NullEncryption
end
module Zip::TraditionalEncryption
end
class Zip::TraditionalEncrypter < Zip::Encrypter
  include Zip::TraditionalEncryption
end
class Zip::TraditionalDecrypter < Zip::Decrypter
  include Zip::TraditionalEncryption
end
class Zip::Inflater < Zip::Decompressor
end
class Zip::Deflater < Zip::Compressor
end
class Zip::StreamableStream < Anonymous_Delegator_114
end
class Zip::StreamableDirectory < Zip::Entry
end
class Zip::Error < StandardError
end
class Zip::EntryExistsError < Zip::Error
end
class Zip::DestinationFileExistsError < Zip::Error
end
class Zip::CompressionMethodError < Zip::Error
end
class Zip::EntryNameError < Zip::Error
end
class Zip::EntrySizeError < Zip::Error
end
class Zip::InternalError < Zip::Error
end
class Zip::GPFBit3Error < Zip::Error
end
class Zip::DecompressionError < Zip::Error
end
module Zip::FileSystem
end
class Zip::FileSystem::ZipFsFile
end
class Zip::FileSystem::ZipFsFile::ZipFsStat
end
class Zip::FileSystem::ZipFsDir
end
class Zip::FileSystem::ZipFsDirIterator
  include Enumerable
end
class Zip::FileSystem::ZipFileNameMapper
  include Enumerable
end
