use Rack::MethodOverride

helpers do 
  def current_user
    if is_logged_in?
        User.find(session[:user_id])
    end
  end
  
  def is_logged_in?
     !session[:user_id].nil? 
  end
end

get '/' do
    @posts = Post.order(created_at: :desc)
    erb :index
end
get '/login' do
    erb :login 
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end

post '/login' do
    user = User.find_by({username: params[:username]});
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect "/"
    else
      @error_message = "Login Failed"
      erb :login
    end
end
get '/signup' do
    @user = User.new
    erb :signup
end

post '/signup' do
   @user = User.new(params)
    if @user.save
      redirect "/login"
    else
       erb(:signup)
    end
end

get '/posts/new' do
  @post = Post.new
  erb :"posts/new"
end

post '/posts' do
  #instantiate new post and attempt save
  
  @post = Post.new({photo_url: params[:photo_url], user_id: current_user.id})
  if @post.save
      redirect "/"
  else
     erb :"posts/new" 
  end
end
# changes to note**
# index.erb anchored images to a show "one" view
# added show.erb 
# add shared folder
# added lotr_character folder


# get all of our lotr characters
get '/lotr_characters' do
  @lotr_characters = LotrCharacter.all
  erb :'lotr_fanpage/index'
end
# get the view that has our create a character form
get "/lotr_characters/new" do
    erb :'lotr_fanpage/new'
end
#post our create lotr character form
post '/lotr_characters' do
    @lotr_character = LotrCharacter.new({
        name: params[:name],
        icon_url: params[:icon_url],
        race: params[:race],
        age: params[:age],
        has_beard: params[:has_beard] == "on" ? true : false #ternary operator
    })
    
    if @lotr_character.save
        redirect '/lotr_characters'
    else
        erb :'lotr_fanpage/new'
    end
end

# what if we want a view to  get a specific lotr character?
get '/lotr_characters/:id' do
    @lotr_character = LotrCharacter.find_by({id: params[:id]})
    if @lotr_character
        erb :'lotr_fanpage/show'
    else
        redirect '/'
    end
end
##if we have time.. edit and patch routes



































get '/lotr_characters/:id/edit' do
    @lotr_character = LotrCharacter.find_by({id: params[:id]})
    if @lotr_character
      erb :'lotr_fanpage/edit'   
    else
      #no character found
      #redirect user to home since they would only find them selves
      #at this point if they attempted to modify the url directly
      redirect '/'
    end
end

post '/lotr_characters/:id' do
    lotr_character = LotrCharacter.find_by({id: params[:id]})
    lotr_character.name = params[:'updated-name']
    lotr_character.icon_url = params[:'updated-icon-url']
    lotr_character.save
    redirect "/lotr_characters/#{lotr_character.id}"
end
#   <input type="hidden" name="_method" value="PATCH">
# patch '/lotr_character/:id' do
    # we get access to the params hash since data is stored in the request body
    # lotr_char = LotrCharacter.find_by({id: params[:id]})
    # lotr_char.name = params[:name]
    # lotr_char.has_beard = params[:has_beard] == 'on' ? true: false
# end




