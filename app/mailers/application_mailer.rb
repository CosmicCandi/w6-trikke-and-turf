class ApplicationMailer < ActionMailer::Base

  require 'sendgrid-ruby'
  include SendGrid

  from = Email.new(email: 'test@example.com')
  subject = 'Welcome to the Trikke and Turf Community!'
  to = Email.new(email: 'test@example.com')
  content = Content.new(type: 'text/plain', value: 'Hello, Email!')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers

end
