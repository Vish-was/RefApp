require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC9084f4671acd3b4a53632912a3e84d9e'
auth_token = '1c30d54293e410411e0ef53cce3985eb'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token