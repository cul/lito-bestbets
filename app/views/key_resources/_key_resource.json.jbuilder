json.extract! key_resource, :id, :title, :url, :description, :contexts, :keywords, :categories

json.haystack [key_resource.title, key_resource.description, key_resource.keywords].join(' ')

# Turn CSV keywords into space-less tokens
# (works together with "concatter" custom typeahead tokenizer)
json.tokens (key_resource.keywords || '').delete(' ').tr(',', ' ')
