get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do

  erb :_create_note
end

get '/notes_list' do
  @notes = Note.all
  erb :notes
end


# get '/notes/:id/edit' do
#   @note = Note.find(params[:id])
#   erb :edit
# end


post '/notes' do
  @note = Note.create(title: params[:title], content: params[:content])  

  redirect "/notes_list"
end


post '/notes/:id' do
  @note = Note.find(params[:id])
  @note.update_attributes(params[:note])
  redirect "/notes/#{@note.id}" 
end

get '/notes/:id' do
  @notes = Note.all
  @note = Note.find(params[:id])
  erb :notes
end
