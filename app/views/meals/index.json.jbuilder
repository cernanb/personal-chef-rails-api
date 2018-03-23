json.array! @meals do |meal|
  json.id meal.id
  json.name meal.name
  json.url meal.url
  json.notes meal.meal_notes do |note|
    note.content
  end
end