class VisitorsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(secure_params)
		if @contact.valid?
			# TODO save data
			# TODO send message
			flash[:notice] = "message sent from #{@contact.name}."
			redirect_to_root_path
		else 
			render :new
		end
	end

	private

	def secure_params
		params.require(:contact).permit(:name, :email, :content)
	end
end