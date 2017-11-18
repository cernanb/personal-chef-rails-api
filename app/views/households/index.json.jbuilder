json.array! @households do |household|
  json.id household.id
  json.name household.name
  json.address household.address
  json.monthly_rate household.monthly_rate
  json.meal_ids household.meal_ids
  json.client household.client?
  json.engagement household.next_engagement
  json.notes household.notes do |note|
    json.id note.id
    json.content note.content
    json.created_at note.created_at
  end
end