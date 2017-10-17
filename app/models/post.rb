class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :likes
    
    # validations
    validates :photo_url, presence: true
    validates :photo_url, format: { with: URI.regexp }, if: 'photo_url.present?'
    validates :user_id, presence: true
    validates :user, presence: true
    
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        if time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end
    
    def like_count
        self.likes.size
    end
    
    def comment_count
        self.comments.size
    end
end

