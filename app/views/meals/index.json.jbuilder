json.array! @meals do |meal|
  json.id meal.id
  json.name meal.name
  json.notes meal.meal_notes do |note|
    note.content
  end
end