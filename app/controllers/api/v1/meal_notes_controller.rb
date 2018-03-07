class Api::V1::MealNotesController < ApplicationController
  def create
    meal = Meal.find_by(:meal_id)
    note = meal.meal_notes.build(meal_note_params)
    if note.save 
      render json: note
    else
      render json: {
        errors: note.errors.full_messages         
      }, status: 500
    end
  end

  private
    def meal_note_params
      params.require(:meal_note).permit(:content)
    end
end
