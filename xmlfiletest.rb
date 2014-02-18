require 'rubygems'
require 'builder'
require 'SecureRandom'

a = Time.now

File.open("UPASS_Upload.xml", 'w') {|f|
xml = Builder::XmlMarkup.new(:target => f, :indent => 1)

xml.instruct! # <?xml version="1.0" encoding="UTF-8"?>
xml.instruct! :aaa, :bbb=>"ccc" # xsd

  (1..10).each do |counter|
    xml.tag!("tns:SetEligibility") {
    #xml.products {
    	# xml.id_ counter
        # xml.date "2014-01"
        xml.tag!("tns:GUID", SecureRandom.uuid)
        xml.tag!("tns:DATE", "2014-01")
        xml.tag!("tns:ELIG", "TRUE")
        xml.tag!("tns:TSID", counter)
    }
    end

}
puts (Time.now-a).to_s