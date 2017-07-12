#!/usr/bin/env rake

require 'rake'
require 'fileutils'
require 'bundler/setup'

Bundler.require(:default)

DaFunk::RakeTask.new do |t|
  t.mrbc  = "cloudwalk compile"
  t.mruby = "cloudwalk run -b"
end

