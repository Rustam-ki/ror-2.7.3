class ContactsController < ApplicationController
  # GET /contacts or /contacts.json
  def index
  end

  # GET /contacts/new
  def new

  end

  def create
    message = params[:message]
    email = params[:email]
    if message && email
      ContactsMailer.contact_form(email, message).deliver
    end
  end

end
