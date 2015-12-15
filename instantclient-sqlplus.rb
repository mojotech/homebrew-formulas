require 'formula'
require File.expand_path('../util/instantclient', __FILE__)

# A formula that installs the Instantclient Sqlplus package.
class InstantclientSqlplus < Formula
  include Instantclient

  desc 'Oracle Instantclient Sqlplus x64.'
  homepage 'http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html'

  url 'https://github.com/mojotech/homebrew-formulas/blob/master/files/instantclient-sqlplus-macos.x64-11.2.0.4.0.zip?raw=true'
  sha256 '127d2baaa4c72d8591af829f00dea5e2a77c0e272ce8fc091dd853e9406845b9'

  option 'with-basiclite', 'Depend on instantclient-basiclite instead of instantclient-basic.'

  depends_on 'instantclient-basic' unless build.with?('basiclite')
  depends_on 'instantclient-basiclite' if build.with?('basiclite')

  def install
    Dir['*.dylib'].each do |file|
      fix_oracle_lib_path(file)
    end
    fix_oracle_lib_path('sqlplus')
    lib.install Dir['*.dylib']
    bin.install ['sqlplus']
  end
end
