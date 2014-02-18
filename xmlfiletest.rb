require 'rubygems'
require 'builder'

a = Time.now

File.open("UPASS_Upload.xml", 'w') {|f|
xml = Builder::XmlMarkup.new(:target => f, :indent => 1)

xml.instruct! # <?xml version="1.0" encoding="UTF-8"?>

  (1..10).each do |counter|
    xml.tag!("tns:SetEligibility") {
    #xml.products {
    	# xml.id_ counter
        # xml.date "2014-01"
        xml.tag!("tns:GUID", "asdf-xxxx-1234")
        xml.tag!("tns:DATE", "2014-01")
        xml.tag!("tns:ELIG", "TRUE")
    }
    end

}
puts (Time.now-a).to_s