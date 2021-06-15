require "savon"

class AuthenticationService
  def initialize
    @client = Savon.client(wsdl: "http://example.com?wsdl")
  end

  def authenticate(message)
    @client.call(message: message)
  end
end
