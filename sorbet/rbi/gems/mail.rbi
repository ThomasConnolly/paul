# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/mail/all/mail.rbi
#
# mail-2.8.1

module Mail
end
module Mail::VERSION
end
class Mail::IndifferentHash < Hash
end
module Mail::Multibyte
end
module Mail::Multibyte::Unicode
  extend Mail::Multibyte::Unicode
end
class Mail::Multibyte::Unicode::Codepoint
end
class Mail::Multibyte::Unicode::UnicodeDatabase
end
class Mail::Multibyte::Chars
  include Comparable
end
class Mail::Multibyte::EncodingError < StandardError
end
module Mail::Constants
end
module Mail::Utilities
  extend Mail::Utilities
end
class Mail::Utilities::StrictCharsetEncoder
end
class Mail::Utilities::BestEffortCharsetEncoder
end
class Mail::Configuration
  extend Singleton::SingletonClassMethods
  include Singleton
end
class Mail::Retriever
end
module Mail::YAML
end
class Mail::Message
end
class Mail::Part < Mail::Message
end
class Mail::Header
  include Enumerable
end
class Mail::PartsList < Anonymous_Delegator_96
end
class Mail::AttachmentsList < Array
end
class Mail::Body
end
class Mail::CommonField
end
class Mail::StructuredField < Mail::CommonField
end
class Mail::NamedStructuredField < Mail::StructuredField
end
class Mail::AddressContainer < Array
end
class Mail::CommonAddressField < Mail::NamedStructuredField
end
class Mail::ToField < Mail::CommonAddressField
end
class Mail::CcField < Mail::CommonAddressField
end
class Mail::BccField < Mail::CommonAddressField
end
class Mail::CommonMessageIdField < Mail::NamedStructuredField
end
class Mail::MessageIdField < Mail::CommonMessageIdField
end
class Mail::InReplyToField < Mail::CommonMessageIdField
end
class Mail::ReferencesField < Mail::CommonMessageIdField
end
class Mail::UnstructuredField < Mail::CommonField
end
class Mail::NamedUnstructuredField < Mail::UnstructuredField
end
class Mail::SubjectField < Mail::NamedUnstructuredField
end
class Mail::CommentsField < Mail::NamedUnstructuredField
end
class Mail::KeywordsField < Mail::NamedStructuredField
end
module Mail::ParserTools
end
module Mail::Parsers
end
module Mail::Parsers::DateTimeParser
  extend Mail::ParserTools
end
class Mail::DateTimeElement
end
class Mail::CommonDateField < Mail::NamedStructuredField
end
class Mail::DateField < Mail::CommonDateField
end
class Mail::FromField < Mail::CommonAddressField
end
class Mail::SenderField < Mail::CommonAddressField
end
class Mail::ReplyToField < Mail::CommonAddressField
end
class Mail::ResentDateField < Mail::CommonDateField
end
class Mail::ResentFromField < Mail::CommonAddressField
end
class Mail::ResentSenderField < Mail::CommonAddressField
end
class Mail::ResentToField < Mail::CommonAddressField
end
class Mail::ResentCcField < Mail::CommonAddressField
end
class Mail::ResentBccField < Mail::CommonAddressField
end
class Mail::ResentMessageIdField < Mail::CommonMessageIdField
end
class Mail::ReturnPathField < Mail::CommonAddressField
end
class Mail::ReceivedField < Mail::NamedStructuredField
end
class Mail::MimeVersionField < Mail::NamedStructuredField
end
class Mail::ContentTransferEncodingField < Mail::NamedStructuredField
end
class Mail::ContentDescriptionField < Mail::NamedUnstructuredField
end
class Mail::UnknownEncodingType < StandardError
end
module Mail::Encodings
  extend Mail::Utilities
  include Mail::Constants
end
class Mail::ParameterHash < Mail::IndifferentHash
end
class Mail::ContentDispositionField < Mail::NamedStructuredField
end
class Mail::ContentTypeField < Mail::NamedStructuredField
end
class Mail::ContentIdField < Mail::NamedStructuredField
end
class Mail::ContentLocationField < Mail::NamedStructuredField
end
class Mail::Field
  include Comparable
end
class Mail::Field::FieldError < StandardError
end
class Mail::Field::ParseError < Mail::Field::FieldError
end
class Mail::Field::NilParseError < Mail::Field::ParseError
end
class Mail::Field::IncompleteParseError < Mail::Field::ParseError
end
class Mail::Field::SyntaxError < Mail::Field::FieldError
end
class Mail::FieldList < Array
end
class Mail::Envelope < Mail::NamedStructuredField
end
class Mail::Encodings::TransferEncoding
end
class Mail::Encodings::Identity < Mail::Encodings::TransferEncoding
end
class Mail::Encodings::Binary < Mail::Encodings::Identity
end
class Mail::Encodings::EightBit < Mail::Encodings::Binary
end
class Mail::Encodings::SevenBit < Mail::Encodings::EightBit
end
class Mail::Encodings::Base64 < Mail::Encodings::SevenBit
end
class Mail::Encodings::QuotedPrintable < Mail::Encodings::SevenBit
end
class Mail::Encodings::UnixToUnix < Mail::Encodings::TransferEncoding
end
module Mail::Matchers
end
class Mail::Matchers::HasSentEmailMatcher
end
class Mail::Matchers::AnyAttachmentMatcher
end
class Mail::Matchers::AttachmentFilenameMatcher
end
class Mail::Matchers::AttachmentMimeTypeMatcher
end
module Mail::CheckDeliveryParams
end
class Mail::SmtpEnvelope
end
class Mail::TestMailer
end
class Mail::SMTP
end
class Mail::FileDelivery
end
class Mail::Sendmail
end
class Mail::Sendmail::DeliveryError < StandardError
end
module Mail::Parsers::AddressListsParser
  extend Mail::ParserTools
end
class Mail::Address
end
class Mail::AddressList
end