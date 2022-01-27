class ContactsController < ApplicationController
  # GET /contacts or /contacts.json
  def index
  end

  # GET /contacts/new
  def new
    message = params[:message]
    email = params[:email]
    if message and email
      ContactsMailer.contact_form(email, message).deliver
      redirect_to new_contact_path, notice: 'Message sent'
    end
  end

end
