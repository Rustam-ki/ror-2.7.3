=begin
class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message
  
  def headers
    {
      subject: "My contact form",
      to: "thejadeonwot@gmail.com",
      from: %("#{name}" "#{email}")
    }
  end
end
=end
