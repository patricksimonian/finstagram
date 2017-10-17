test.rb

# single page app style
# post '/api/posts/new' do
#   content_type :json
#   json = JSON.parse(request.body.read)
#   user = current_user
#   post = Post.new({
#       photo_url: json["photo_url"], #why using "" vs :? advanced ruby discussion on symbols verse variables
#       user_id: user.id
#   })
#   if post.save
#       response_object = {
#           error: false,
#           post_data: {
#               photo_url: post.photo_url,
#               username: post.user.username,
#               comment_count: post.comment_count,
#               time: post.humanized_time_ago,
#               user_avatar: post.user.avatar_url,
#               like_count: post.like_count
#           }
#       }.to_json
#   else
#       response_object = {
#           error: true,
#           messages: post.errors.full_messages.to_s,
#           param: json["photo_url"]
#         }.to_json
#   end
# end
