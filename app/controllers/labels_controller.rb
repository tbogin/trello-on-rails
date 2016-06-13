class LabelsController < ApplicationController
	def new
		@label = Label.new
	end

	def create
		@card = Card.find_by(id: params[:id])
		@label = @card.labels.new(label_params)
		if @label.save
			redirect_to @card
		else
			render 'new'
		end
	end

	def destroy
		@label = Label.find_by(id: params[:id])
		@label.destroy
		redirect_to labels_path
	end

private

	def label_params
		params.require(:label).permit(:color)
	end
end
