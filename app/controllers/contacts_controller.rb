class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @contact = params[:id] ? Contact.find(params[:id]) : Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Contact #{@contact.name} created."
    else
      @contacts = Contact.all
      render :index
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact #{@contact.name} updated."
    else
      @contacts = Contact.all
      render :index
    end
  end

  def confirm_destroy
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: "Contact #{@contact.name} deleted."
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
