json.extract! book, :id, :name, :description, :published, :created_at, :updated_at
json.url book_url(book, format: :json)
