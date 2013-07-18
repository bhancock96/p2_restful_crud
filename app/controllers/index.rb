get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do

  erb :create_note
end

post '/create' do
  @note = Note.create(title: params[:title], content: params[:content])
  @note.save
  redirect '/notes' 
end

get '/notes' do
  @notes = Note.all
  erb :notes
end
