require 'builder'
require 'securerandom'

a = Time.now
i = 0 # starting number for GUID if you are using 'Sequence' versus real GUIDS

numRecordsDesired = 100 # number of eligibility requests desired
numMonths = 12 # number of months to create eligibility requests for
numYears = 3 # how many years of data to create
numYearStart = 2014 # year in which you would like to start the eligibility records
strIDTypeFlag = 'Sequence' # Indicates how you want GUID field populated. Use 'GUID' or 'Sequence'

File.open("UPASS_Upload.xml", 'w') {|f|
xml = Builder::XmlMarkup.new(:target => f, :indent => 1)

xml.tag!("tns:upass", "xmlns:tns".to_sym => "http://ns.translink.ca/upass/1.11-poc") do

    numTimestoLoop = (numRecordsDesired/numMonths)/numYears
    (1..numTimestoLoop).each do |numRecord|

        if strIDTypeFlag == 'GUID'
             myUUID = SecureRandom.uuid

        elsif strIDTypeFlag == 'Sequence'
            myUUID = i += 1

        end
            

        (1..numYears).each do |numYearCounter|

            (1..numMonths).each do |numMonthCounter|
                xml.tag!("tns:SetEligibilityRequest") {
                    #xml.products {
                    # xml.id_ counter
                    # xml.date "2014-01"
                    xml.tag!("tns:guid", myUUID)
                    xml.tag!("tns:tsid", numRecord.to_s)
                    xml.tag!("tns:elig", "ELIG")
                    xml.tag!("tns:date", (numYearStart + numYearCounter -1).to_s + "-" + sprintf("%02d", numMonthCounter))
                }
            end # Months do

        end # Years do

    end # Records do (aka the Student)

end # tns:upass

} #file open
puts "100% Complete - (" + (Time.now-a).to_s + ")"