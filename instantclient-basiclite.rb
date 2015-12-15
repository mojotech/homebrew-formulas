require 'formula'
require File.expand_path('../util/instantclient', __FILE__)

# A formula that installs the Instantclient Basiclite package.
class InstantclientBasiclite < Formula
  include Instantclient

  desc 'Oracle Instantclient Basiclite x64.'
  homepage 'http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html'

  url 'https://github.com/mojotech/homebrew-formulas/blob/master/files/instantclient-basiclite-macos.x64-11.2.0.4.0.zip?raw=true'
  sha256 'd51c5fb67d1213c9b3c6301c6f73fe1bef45f78197e1bae7804df4c0abb468a7'

  conflicts_with 'instantclient-basic'

  def install
    %w(libclntsh.dylib libocci.dylib).each do |dylib|
      ln_s "#{dylib}.11.1", dylib
    end
    lib.install Dir['*.dylib*']
  end

  def post_install
    Dir[lib / '*.dylib*'].each do |file|
      fix_oracle_lib_path(file)
    end
  end
end
