use Rack::MethodOverride

helpers do 
  ##making methods in here are useable inside our erb files
  def is_logged_in?
    !session[:user_id].nil? 
  end
  
  def logout_user
    session[:user_id] = nil 
  end
  
  def current_user
    # session[:user_id] ALWAYS EXISTS
     User.find_by(id: session[:user_id])
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
  logout_user
  redirect "/"
end

post '/login' do
   user = User.find_by({username: params[:username]})
   if user && user.password == params[:password]
     session[:user_id] = user.id
     redirect '/'
   else
     @error_message = "The username and or password was incorrect"
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

# 
get '/posts/new' do

      @post = Post.new
      erb :"posts/new"
end

post '/posts' do
    #instantiate new post and attempt save
    
    #get current_user if they are logged in
    user = current_user
    # user has the potential to be either the 'said' user or nil (nil is false)
    if user
        # user exists, lets create a post
        @post = Post.new({photo_url: params[:photo_url], user_id: current_user.id})
        # if post saves
        if @post.save
            redirect '/'
        else
            # post didn't save
            erb :"posts/new"
        end
    else
        # do something appropriate for not being logged in
        "Your not logged in!!!! BAD"
    end


end



get '/posts/:id' do
   @post = Post.find(params[:id])
   erb :'/posts/show' 
end

