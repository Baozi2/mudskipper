xml.instruct!
xml.gupdate(xmlns: 'http://www.google.com/update2/response', protocol: '2.0') do
  xml.app(appid: @crx[:appid]) do
    xml.updatecheck({codebase: @crx[:codebase], version: @crx[:version]})
  end
end