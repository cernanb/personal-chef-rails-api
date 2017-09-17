json.array! @households do |household|
  json.id household.id
  json.name household.name
  json.address household.address
  json.monthly_rate household.monthly_rate
  json.meal_ids household.meal_ids
  json.client household.client?
end