# typed: strict
# frozen_string_literal: true

Geocoder.configure(
  # Geocoding options
  timeout: 4,                 # geocoding service timeout (secs)
  lookup: :ipinfo_io,         # name of geocoding service (symbol)
  ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
  language: :en,              # ISO-639 language code
  use_https: true,            # use HTTPS for geocoding service calls
  http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  api_key: Rails.application.credentials.dig(:ipinfo, :api_key), # API key for geocoding service
  cache: $redis, # cache object (must respond to #[], #[]=, and #del)
  cache_prefix: 'geocoder:', # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError, TimeoutError, Errno::* errors
  always_raise: [],

  # Calculation options
  units: :mi,                 # :km for kilometers or :mi for miles
  distances: :linear          # :spherical or :linear
)
