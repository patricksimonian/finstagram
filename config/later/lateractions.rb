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

