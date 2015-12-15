require 'formula'
require File.expand_path('../util/instantclient', __FILE__)

# A formula that installs the Instantclient SDK package.
class InstantclientSdk < Formula
  include Instantclient

  desc 'Oracle Instantclient SDK x64.'
  homepage 'http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html'

  url 'https://github.com/mojotech/homebrew-formulas/blob/master/files/instantclient-sdk-macos.x64-11.2.0.4.0.zip?raw=true'
  sha256 'aead0663c206a811cf1f61d3b2a533ff81e6e6109dd31544ad850a7ef6eb5d19'

  def install
    include.install Dir['sdk/include/*.h']
    # lib.install ['sdk']
  end
end
