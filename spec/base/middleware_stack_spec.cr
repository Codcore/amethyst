require "./spec_helper"


describe MiddlewareStack do
  
	mdwstack = MiddlewareStack.new
	bsmdware = TestMiddleware
	request  = Request.new(HTTP::Request.new("GET", "/"))
	response = Response.new(200, "OK")
	mdwstack.add(bsmdware)

  it "processes request" do
    mdwstack.process_request(request)
    request.body.should eq "Request is being processed" 
  end

  it "processes response" do
    mdwstack.process_response(request, response)
    response.body.should eq "Response is being processed"
  end
end