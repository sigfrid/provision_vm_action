#!/usr/bin/env ruby
require 'dotenv/load'

require "net/ssh"
require "erb"

Net::SSH.start(ENV["SSH_HOST"], ENV["SSH_USER"], keys: [], key_data: [File.read(ENV["SSH_KEY_PATH"])], keys_only: true) do |ssh|
  puts ssh.exec!(ERB.new(File.read("./scripts/echo")).result)
end

