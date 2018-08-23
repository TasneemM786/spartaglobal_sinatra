require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?

get '/books' do
  'gets and displays all books'
end

get '/books/new' do
  'return HTML form creating a new book'
end

post '/books' do
  'creates new book'
end

get '/books/:id' do
  id = params[:id]
  "gets and displays a book with the id: #{id}"
end

get '/book/:id/edit' do
  'return HTML form editing a book'
end

put '/book/:id' do
  'use specific book'
end

delete '/book/:id' do
  deletes specific photo
end
