require 'formula'
require File.expand_path('./util/instantclient', __FILE__)

# A formula that installs the Instantclient Basic package.
class InstantclientBasic < Formula
  include Instantclient

  desc 'Oracle Instantclient Basic x64.'
  homepage 'http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html'

  url 'https://github.com/mojotech/homebrew-formulas/blob/master/files/instantclient-basic-macos.x64-11.2.0.4.0.zip?raw=true'
  sha256 '6c079713ab0a65193f7bfcbad6c90e7806fa6634a3828052f8428e1533bb89d3'

  conflicts_with 'instantclient-basiclite'

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
