class ContactsMailer < ApplicationMailer
  def contact_form(data)
    @email = data.email
    @message = data.message

    mail to: 'bashbez.ru@yandex.ru'
  end
end
