require 'twilio-ruby'

class TwilioController < ApplicationController
  # Before we allow the incoming request to connect, verify
  # that it is a Twilio request
  before_filter :authenticate_twilio_request, :only => [
    :voice
  ]

  # Define our Twilio credentials as instance variables for later use
  @@twilio_sid = ENV['TWILIO_ACCOUNT_SID']
  @@twilio_token = ENV['TWILIO_AUTH_TOKEN']
  @@twilio_number = ENV['TWILIO_NUMBER']



  # Handle a POST from our web form and connect a call via REST API
  def call

      @full_phone = current_user.phone
      @partial_phone = @full_phone.last(-1)
      @connected_number = "+61" + @partial_phone

      @client = Twilio::REST::Client.new @@twilio_sid, @@twilio_token
      # Connect an outbound call to the number submitted
      @call = @client.calls.create(
        :from => @@twilio_number,
        :to => @connected_number,
        :url => 'https://oreillys.com.au/voice.xml' # Fetch instructions from this URL when the call connects
      )


  end

  # This URL contains instructions for the call that is connected with a lead
  # that is using the web form.
  def voice
    # Our response to this request will be an XML document in the "TwiML"
    # format. Our Ruby library provides a helper for generating one
    # of these documents
    response = Twilio::TwiML::Response.new do |r|
           r.Say 'If this were a real click to call implementation, you would be connected to an agent at this point.', :voice => 'alice'
           r.Dial @award.phone  #This needs a variable to talk to see jobs controller mytradies
    end
    render text: response.text
  end


  # Authenticate that all requests to our public-facing TwiML pages are
  # coming from Twilio. Adapted from the example at
  # http://twilio-ruby.readthedocs.org/en/latest/usage/validation.html
  # Read more on Twilio Security at https://www.twilio.com/docs/security
  private
  def authenticate_twilio_request
    twilio_signature = request.headers['HTTP_X_TWILIO_SIGNATURE']

    # Helper from twilio-ruby to validate requests.
    @validator = Twilio::Util::RequestValidator.new(@@twilio_token)

    # the POST variables attached to the request (eg "From", "To")
    # Twilio requests only accept lowercase letters. So scrub here:
    post_vars = params.reject {|k, v| k.downcase == k}

    is_twilio_req = @validator.validate(request.url, post_vars, twilio_signature)

    unless is_twilio_req
      render :xml => (Twilio::TwiML::Response.new {|r| r.Hangup}).text, :status => :unauthorized
      false
    end
  end

end