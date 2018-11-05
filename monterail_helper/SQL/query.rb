# -- Working solution for query
class Query
  def get(today: Date.today)
    Post
      .order(posted_at: :desc)
      .includes(:user, comments: :user)
      .map do |post|
        {
          id: post.id,
          title: post.title,
          content: post.content,
          posted_at: post.posted_at,
          last_comment_at: post.comments&.last&.posted_at,
          number_of_comments: post.comments&.count || 0,
          author: {
            id: post.user.id,
            first_names: post.user.first_names,
            last_names: post.user.last_names
          },
          comments: post.comments&.order(posted_at: :asc)&.map do |comment|
            {
              content: comment.content,
              posted_at: comment.posted_at,
              author: {
                id: comment.user&.id,
                full_name: "#{comment.user&.first_names} #{comment.user&.last_names}",
                age: ((today - comment.user&.birthday || 0) / 365).floor,
                number_of_comments: comment.user&.comments&.count
              }
            }
          end
        }
      end
  end
end
