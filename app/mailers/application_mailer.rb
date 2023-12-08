class ApplicationMailer < ActionMailer::Base
  prepend_view_path "app/views/mailers"
  default from: "from@example.com"
  layout "mailer"
end
