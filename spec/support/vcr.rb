require "vcr"
VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<DIRECTORY_URL>") { ENV["LE_DIRECTORY"] }
end
