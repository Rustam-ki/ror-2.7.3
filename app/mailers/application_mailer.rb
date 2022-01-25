class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <bashbez.ru@yandex.ru>}
  layout 'mailer'
end
