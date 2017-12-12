use Rack::MethodOverride

def humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago"
  end
end

def current_user
  User.find_by({id: session[:user_id]})
end

def is_logged_in?
  !current_user.nil?
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
  user = User.find_by({username: params[:username]})
  if user && user.password == params[:password]
    #logging user
    session[:user_id] = user.id
    redirect '/'
  else
    @error_message = "username or password was incorrect"
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
# POSTS

before '/posts/new' do
  if !is_logged_in?
    redirect '/login'
  end
end
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

get '/home' do
  @billy_bob = Owner.find(6)
  erb :home
end

get '/fizzbuzz' do
#   FizzBuzz
# We're going to write a simple program together to continue
# to hone our Ruby skills. This one's a classic.
# Our code should do the following things:
# Make a list of numbers from 1 to 100, inclusive
# For each number, perform the following tests on it:
# FIZZ
# If the number is divisible by 3, output 'Fizz'
# BUZZ
# If the number is divisible by 5, output 'Buzz'
# FIZZBUZZ
# If the number is divisible by BOTH 3 and 5, output 'FizzBuzz'
  def fizzbuzz(low, high)
    fizzbuzz_string_output = []
    (low..high).each do |n|
      value_to_push = ""
      #flow control exists within loop
      if n % 3 == 0
        value_to_push += "Fizz"
      end
    
      if n % 5 == 0
        value_to_push += "Buzz"
      end
      
      
      fizzbuzz_string_output.push(value_to_push == "" ? n : value_to_push)
    end
    fizzbuzz_string_output.join(",<br>")
  end
  
  result = fizzbuzz(50, 100)
  result.to_s
end