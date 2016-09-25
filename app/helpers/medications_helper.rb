require "net/https"
require "uri"

module MedicationsHelper
  def get_generics(original_drug)

    clientId = "1197"
    secret = "n1ndBzCNh+hW7kbVueswEsCGNiDd1yS6U4MKk3kOe14="
    #
    # #Build up a uri that will pull the Title and How To Use sections
    # # of the patient education monograph for Digoxin (DispensableGeneric Id = 11)
    address = "https://api.fdbcloudconnector.com/CC/api/v1_3"
    #
    address = address + "/GenericDrugs?callSystemName=Dr. Sprenkle EHR&searchText=#{original_drug.name}&callid=1234&deptName=Patient e-Rx"
    uri = URI.parse(address)
    uri.query = [uri.query, "callsystemname=demo"].compact.join('?')
    uri.query = [uri.query, "sections=T,H"].compact.join('&')
     
    #add the headers required for authorization,
    # and to return the response in JSON format
    request = Net::HTTP::Get.new(uri.request_uri)
    request["Authorization"] = "SHAREDKEY " + clientId + ":" + secret
    request["Accept"] = "application/json"

    #make the call
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.ssl_version = :TLSv1

    #res = http.request(request)
    res = http.start() do |http|
      http.request(request)
    end

    #output the response
    if res.code == '200'
      return res.body
    else
      puts res.code
      puts res.message
      puts res.class.name
    end
  end

  def is_brand_name?(original_drug)

    clientId = "1197"
    secret = "n1ndBzCNh+hW7kbVueswEsCGNiDd1yS6U4MKk3kOe14="

    #Build up a uri that will pull the Title and How To Use sections
    # of the patient education monograph for Digoxin (DispensableGeneric Id = 11)
    # address = "https://api.fdbcloudconnector.com/CC/api/v1_3"

    # # address = address + "/DrugNames?callSystemName=Dr. Sprenkle EHR&callid=1234&deptName=Dental Surgery Center&searchText=#{original_drug.name}"
    # address = address + "/DrugNames?callSystemName=Dr. Sprenkle EHR&callid=1234&deptName=Dental Surgery Center&searchText=Namenda"
    address = "https://api.fdbcloudconnector.com/CC/api/v1_3/DrugNames?callSystemName=Dr. Sprenkle EHR&callid=1234&deptName=Dental Surgery Center&searchText=carbocain"

    uri = URI.parse(address)
    uri.query = [uri.query, "callsystemname=demo"].compact.join('?')
    uri.query = [uri.query, "sections=T,H"].compact.join('&')

    #add the headers required for authorization,
    # and to return the response in JSON format
    request = Net::HTTP::Get.new(uri.request_uri)
    request["Authorization"] = "SHAREDKEY " + clientId + ":" + secret
    request["Accept"] = "application/json"

    #make the call
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.ssl_version = :TLSv1

    #res = http.request(request)
    res = http.start() do |http|
      http.request(request)
    end

    #output the response
    if res.code == '200'
      data = res.body
      # parsed_data = JSON.parse(data)
      # type = parsed_data["Items"][0]["NameTypeCode"]
      p "FROM HELPER DATA VARIABLE" * 15
      p data
      type = data["Items"][0]["NameTypeCode"]
      if type == "1"
        return true
      else
        return false
      end

      # if res.body.nametypecode == 1
        #return true
      # else return false

    else
      puts res.code
      puts res.message
      puts res.class.name
    end
  end
end
