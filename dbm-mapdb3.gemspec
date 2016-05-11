# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'rexml/document'
require 'rexml/xpath'

doc = REXML::Document.new File.new('pom.xml')
DBM_VERSION = REXML::XPath.first(doc, "//project/version").text

files = `git ls-files -- lib/* spec/* sample/*`.split("\n")
files << 'lib/dbm.jar'
files << 'lib/mapdb.jar'

Gem::Specification.new do |s|
  s.name        = 'dbm-mapdb3'
  s.version     = DBM_VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['EPL-1.0', 'GPL-2.0', 'LGPL-2.1']
  s.authors     = ['Anthony Bargnesi']
  s.email       = ['abargnesi@gmail.com']
  s.homepage    = 'http://github.com/abargnesi/dbm-mapdb3'
  s.summary     = %q{DBM extension; fork of jruby/dbm}
  s.description = %q{DBM extension using MapDB version 3.}
  s.files         = files
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
  s.has_rdoc      = true
end
