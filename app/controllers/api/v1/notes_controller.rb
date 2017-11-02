class Api::V1::NotesController < ApplicationController
  def create
    @household = Household.find(params[:household_id])
    @note = @household.notes.build(note_params)
    
    if @note.save
      render "notes/show.json.jbuilder", note: @note
    else
      render json: {
        errors: note.errors.full_messages
        }, status: 500
    end
  end

  private
    def note_params
      params.require(:note).permit(:content)
    end
end
