class ContactsController < ApplicationController
  # GET /contacts or /contacts.json
  def index
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactsMailer.contact_form(@contact).deliver_now
      redirect_to new_contact_path, notice: 'Письмо успешно отправлено!'
    else
      flash[:alert] = 'Что-то пошло не так!'
      render :new
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:email, :message)
    end
end
