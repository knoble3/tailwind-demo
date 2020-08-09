class AuthorsController < ApplicationController
    def index
        @form = AuthorForm.new
        @authors = Author.all
    end

    def create
        @form = AuthorForm.new(form_params)

        if @form.save
            render :create
        else
            render :error
        end
    end

    private

    def form_params
        params.require(:author_form).permit(
            author_attributes: [:name],
            music_attributes: [:title],
        )
    end
end