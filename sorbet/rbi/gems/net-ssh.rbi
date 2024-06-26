# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/net-ssh/all/net-ssh.rbi
#
# net-ssh-7.2.3

module Net
end
module Net::SSH
end
class Net::SSH::Exception < RuntimeError
end
class Net::SSH::AuthenticationFailed < Net::SSH::Exception
end
class Net::SSH::ConnectionTimeout < Net::SSH::Exception
end
class Net::SSH::Disconnect < Net::SSH::Exception
end
class Net::SSH::Timeout < Net::SSH::Disconnect
end
class Net::SSH::ChannelRequestFailed < Net::SSH::Exception
end
class Net::SSH::ChannelOpenFailed < Net::SSH::Exception
end
class Net::SSH::HostKeyError < Net::SSH::Exception
end
class Net::SSH::HostKeyMismatch < Net::SSH::HostKeyError
end
class Net::SSH::HostKeyUnknown < Net::SSH::HostKeyError
end
module Net::SSH::Proxy
end
class Net::SSH::Proxy::Error < Net::SSH::Exception
end
class Net::SSH::Proxy::ConnectError < Net::SSH::Proxy::Error
end
class Net::SSH::Proxy::UnauthorizedError < Net::SSH::Proxy::Error
end
class Net::SSH::Proxy::Command
end
class Net::SSH::Config
end
module Net::SSH::Loggable
end
class Net::SSH::Version
  include Comparable
end
module Net::SSH::Authentication
end
module Net::SSH::Authentication::PubKeyFingerprint
end
module OpenSSL
end
class OpenSSL::BN
end
module OpenSSL::PKey
end
class OpenSSL::PKey::PKey
  include Net::SSH::Authentication::PubKeyFingerprint
end
class OpenSSL::PKey::DH < OpenSSL::PKey::PKey
end
class OpenSSL::PKey::RSA < OpenSSL::PKey::PKey
end
class OpenSSL::PKey::DSA < OpenSSL::PKey::PKey
end
class OpenSSL::PKey::EC < OpenSSL::PKey::PKey
end
class OpenSSL::PKey::EC::Point
end
class Net::SSH::Authentication::Certificate
end
module Net::SSH::Authentication::ED25519Loader
end
class Net::SSH::Buffer
end
module Net::SSH::HostKeyEntries
end
class Net::SSH::HostKeyEntries::PubKey < Delegator
end
class Net::SSH::HostKeyEntries::CertAuthority
end
class Net::SSH::HostKeys
  include Enumerable
end
class Net::SSH::KnownHosts
end
module Net::SSH::Transport
end
class Net::SSH::Transport::OpenSSLAESCTR < SimpleDelegator
end
module Net::SSH::Transport::CTR
end
module Net::SSH::Transport::KeyExpander
end
class Net::SSH::Transport::IdentityCipher
end
module Net::SSH::Transport::ChaCha20Poly1305CipherLoader
end
module Net::SSH::Transport::OpenSSLCipherExtensions
end
class Net::SSH::Transport::CipherFactory
end
module Net::SSH::Transport::Constants
end
module Net::SSH::Transport::HMAC
end
class Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::MD5 < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::MD5_96 < Net::SSH::Transport::HMAC::MD5
end
class Net::SSH::Transport::HMAC::SHA1 < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::SHA1_96 < Net::SSH::Transport::HMAC::SHA1
end
class Net::SSH::Transport::HMAC::SHA2_256 < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::SHA2_256_96 < Net::SSH::Transport::HMAC::SHA2_256
end
class Net::SSH::Transport::HMAC::SHA2_512 < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::SHA2_512_96 < Net::SSH::Transport::HMAC::SHA2_512
end
class Net::SSH::Transport::HMAC::SHA2_256_Etm < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::SHA2_512_Etm < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::RIPEMD160 < Net::SSH::Transport::HMAC::Abstract
end
class Net::SSH::Transport::HMAC::None < Net::SSH::Transport::HMAC::Abstract
end
module Net::SSH::Transport::Kex
end
class Net::SSH::Transport::Kex::Abstract
  include Net::SSH::Loggable
  include Net::SSH::Transport::Constants
end
class Net::SSH::Transport::Kex::DiffieHellmanGroup1SHA1 < Net::SSH::Transport::Kex::Abstract
end
class Net::SSH::Transport::Kex::DiffieHellmanGroup14SHA1 < Net::SSH::Transport::Kex::DiffieHellmanGroup1SHA1
end
class Net::SSH::Transport::Kex::DiffieHellmanGroup14SHA256 < Net::SSH::Transport::Kex::DiffieHellmanGroup14SHA1
end
class Net::SSH::Transport::Kex::DiffieHellmanGroupExchangeSHA1 < Net::SSH::Transport::Kex::DiffieHellmanGroup1SHA1
end
class Net::SSH::Transport::Kex::DiffieHellmanGroupExchangeSHA256 < Net::SSH::Transport::Kex::DiffieHellmanGroupExchangeSHA1
end
class Net::SSH::Transport::Kex::Abstract5656 < Net::SSH::Transport::Kex::Abstract
end
class Net::SSH::Transport::Kex::EcdhSHA2NistP256 < Net::SSH::Transport::Kex::Abstract5656
end
class Net::SSH::Transport::Kex::EcdhSHA2NistP384 < Net::SSH::Transport::Kex::EcdhSHA2NistP256
end
class Net::SSH::Transport::Kex::EcdhSHA2NistP521 < Net::SSH::Transport::Kex::EcdhSHA2NistP256
end
module Net::SSH::Transport::Kex::Curve25519Sha256Loader
end
class Net::SSH::Transport::ServerVersion
  include Net::SSH::Loggable
end
class Net::SSH::Transport::Algorithms
  include Net::SSH::Loggable
  include Net::SSH::Transport::Constants
end
module Net::SSH::BufferedIo
  include Net::SSH::Loggable
end
module Net::SSH::ForwardedBufferedIo
end
module Net::SSH::Authentication::Constants
end
module Net::SSH::Connection
end
module Net::SSH::Connection::Constants
end
class Net::SSH::Packet < Net::SSH::Buffer
  include Net::SSH::Authentication::Constants
  include Net::SSH::Connection::Constants
  include Net::SSH::Transport::Constants
end
class Net::SSH::Transport::State
end
module Net::SSH::Transport::PacketStream
  include Net::SSH::BufferedIo
end
module Net::SSH::Verifiers
end
class Net::SSH::Verifiers::Always
end
class Net::SSH::Verifiers::AcceptNew < Net::SSH::Verifiers::Always
end
class Net::SSH::Verifiers::AcceptNewOrLocalTunnel < Net::SSH::Verifiers::AcceptNew
end
class Net::SSH::Verifiers::Never
end
class Net::SSH::Transport::Session
  include Net::SSH::Loggable
  include Net::SSH::Transport::Constants
end
class Net::SSH::Transport::Session::CompatibleVerifier
end
class Net::SSH::Prompt
end
class Net::SSH::Prompt::Prompter
end
class Net::SSH::KeyFactory
end
class InvalidName___Class_0x00___KeyType_107
end
class InvalidName___Class_0x00___OpenSSHPrivateKeyType_108 < InvalidName___Class_0x00___KeyType_107
end
class InvalidName___Class_0x00___OpenSSLKeyTypeBase_109 < InvalidName___Class_0x00___KeyType_107
end
class InvalidName___Class_0x00___OpenSSLPKeyType_110 < InvalidName___Class_0x00___OpenSSLKeyTypeBase_109
end
class InvalidName___Class_0x00___OpenSSLDSAKeyType_111 < InvalidName___Class_0x00___OpenSSLKeyTypeBase_109
end
class InvalidName___Class_0x00___OpenSSLRSAKeyType_112 < InvalidName___Class_0x00___OpenSSLKeyTypeBase_109
end
class InvalidName___Class_0x00___OpenSSLECKeyType_113 < InvalidName___Class_0x00___OpenSSLKeyTypeBase_109
end
class Net::SSH::Authentication::AgentError < Net::SSH::Exception
end
class Net::SSH::Authentication::AgentNotAvailable < Net::SSH::Authentication::AgentError
end
class Net::SSH::Authentication::Agent
  include Net::SSH::Loggable
end
module Net::SSH::Authentication::Agent::Comment
end
class Net::SSH::Authentication::KeyManagerError < Net::SSH::Exception
end
class Net::SSH::Authentication::KeyManager
  include Net::SSH::Loggable
end
module Net::SSH::Authentication::Methods
end
class Net::SSH::Authentication::Methods::Abstract
  include Net::SSH::Authentication::Constants
  include Net::SSH::Loggable
end
class Net::SSH::Authentication::Methods::None < Net::SSH::Authentication::Methods::Abstract
end
class Net::SSH::Authentication::Methods::Publickey < Net::SSH::Authentication::Methods::Abstract
end
class Net::SSH::Authentication::Methods::Hostbased < Net::SSH::Authentication::Methods::Abstract
  include Net::SSH::Authentication::Constants
end
class Net::SSH::Authentication::Methods::Password < Net::SSH::Authentication::Methods::Abstract
end
class Net::SSH::Authentication::Methods::KeyboardInteractive < Net::SSH::Authentication::Methods::Abstract
end
class Net::SSH::Authentication::DisallowedMethod < Net::SSH::Exception
end
class Net::SSH::Authentication::Session
  include Net::SSH::Authentication::Constants
  include Net::SSH::Loggable
  include Net::SSH::Transport::Constants
end
module Net::SSH::Connection::Term
end
class Net::SSH::Connection::Channel
  include Net::SSH::Connection::Constants
  include Net::SSH::Loggable
end
module Net::SSH::Service
end
class Net::SSH::Service::Forward
  include Net::SSH::Loggable
end
class Net::SSH::Connection::Keepalive
  include Net::SSH::Loggable
end
class Net::SSH::Connection::EventLoop
  include Net::SSH::Loggable
end
class Net::SSH::Connection::SingleSessionEventLoop < Net::SSH::Connection::EventLoop
end
class Net::SSH::Connection::Session
  include Net::SSH::Connection::Constants
  include Net::SSH::Loggable
end
class Net::SSH::Connection::Session::NilChannel
end
class Net::SSH::Connection::Session::StringWithExitstatus < String
end
