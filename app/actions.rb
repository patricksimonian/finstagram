helpers do 
  def current_user
    if session[:user_id]
        User.find(session[:user_id])
    end
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


get '/lotr_characters' do
  @lotr_characters = LotrCharacter.all
  erb :lotr_fanpage
end

get "/lotr_characters/new" do
    erb :lotr_character_new
end

post '/lotr_characters/create' do
    @lotr_character = LotrCharacter.new({
        name: params[:name],
        icon_url: params[:icon_url],
        race: params[:race],
        age: params[:age],
        has_beard: params[:has_beard] == "on" ? true : false #ternary operator
    })
    
    # What does = do?
    # params[:age] = 1
    # this would reset params[:age] to be 1
    
    # What does == do?
    # params[:age] == 1
    # this would check IF params[:age] is equal to 1, and tell us 'true or 'false'
    
    if @lotr_character.save
        redirect '/lotr_characters'
    else
        erb :lotr_character_new
    end
end



get '/loop_demo_words' do
 list_of_words = ["welcome", "to", "the", "wonderful", "world", "of", "ruby"]
 
 joined_list_of_words = ""
 list_of_words.each do |word|
     if word != joined_list_of_words[joined_list_of_words.length - 1]
         joined_list_of_words += word + " "
     else
         joined_list_of_words += word + "."
     end
 end
 joined_list_of_words
end







