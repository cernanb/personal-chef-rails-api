json.array! @households do |household|
  json.id household.id
  json.name household.name
  json.address household.address
  json.monthly_rate household.monthly_rate
  json.meal_ids household.meal_ids
  json.client household.client?
  if household.next_engagement
    json.engagement do
      json.id household.next_engagement.id
      json.date household.next_engagement.date
      json.meal_ids household.next_engagement.meal_ids
    end 
  end
  if household.next_engagement
    
    json.meal_ids household.next_engagement.meal_ids
  end
  json.notes household.notes do |note|
    json.id note.id
    json.content note.content
    json.created_at note.created_at
  end
end