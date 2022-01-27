class ContactsMailer < ApplicationMailer
  def contact_form(email, message)
    @email = email
    @message = message

    mail to: 'bashbez.ru@yandex.ru'
  end
end
