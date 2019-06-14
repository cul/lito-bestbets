json.extract! best_bet, :id, :title, :url, :description, :keywords, :tags

json.haystack [best_bet.title, best_bet.description, best_bet.keywords].join(' ')

# Turn CSV keywords into space-less tokens
# (works together with "concatter" custom typeahead tokenizer)
json.tokens best_bet.keywords.delete(' ').tr(',', ' ')



