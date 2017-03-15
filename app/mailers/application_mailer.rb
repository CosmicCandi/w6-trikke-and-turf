class ApplicationMailer < ActionMailer::Base
  default from: 'admin@trikke-and-turf.herokuapp.com'
  layout 'mailer'
end
