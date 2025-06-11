#!/usr/bin/env ruby
require 'dotenv/load'

require "net/ssh"
require "erb"

SSH = Net::SSH.start(ENV["SSH_HOST"],
               ENV["SSH_USER"],
               port: ENV["SSH_PORT"],
               keys: [],
               key_data: [ENV["SSH_KEY"]],
               keys_only: true)

puts SSH.exec!(ERB.new(File.read("./scripts/00_echo")).result)
