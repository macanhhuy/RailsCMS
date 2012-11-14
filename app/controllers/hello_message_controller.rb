class HelloMessageController < ApplicationController
 
web_service_api HelloMessageApi
 web_service_dispatching_mode :direct
  wsdl_service_name 'hello_message'
  web_service_scaffold :invoke

  def hello_message(firstname, lastname)
    return "Hello "+ firstname +" "+lastname
  end
  
  def hello
    @time = Time.now
    @files = Dir.glob('*')
  end
end