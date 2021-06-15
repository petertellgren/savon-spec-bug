require "savon"

class AuthenticationService
  def initialize
    @client = Savon.client(wsdl: "http://example.com?wsdl")
  end

  def authenticate(message)
    @client.call(:authenticate, message: message)
  end
end
