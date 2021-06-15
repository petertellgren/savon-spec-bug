require "spec_helper"

# require the helper module
require "savon/mock/spec_helper"

describe AuthenticationService do
  # include the helper module
  include Savon::SpecHelper

  # set Savon in and out of mock mode
  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }

  describe "#authenticate" do
    it "authenticates the user with the service" do
      message = { username: "luke", password: "secret" }
      fixture = File.read("spec/fixtures/authentication_service/authenticate.xml")

      # set up an expectation
      savon.expects(:authenticate).with(message: message).returns(fixture)

      # call the service
      service = AuthenticationService.new
      response = service.authenticate(message)

      expect(response).to be_successful
    end
  end
end
