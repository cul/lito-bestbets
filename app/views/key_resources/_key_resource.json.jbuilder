json.extract! key_resource, :id, :title, :url, :description

# Return empty string instead of null for optional fields
json.contexts key_resource.contexts || ''
json.keywords key_resource.keywords || ''
json.categories key_resource.categories || ''

json.haystack [key_resource.title, key_resource.description, key_resource.keywords].join(' ')

# Turn CSV keywords into space-less tokens
# (works together with "concatter" custom typeahead tokenizer)
json.tokens (key_resource.keywords || '').delete(' ').tr(',', ' ')
