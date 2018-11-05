SELECT p.id, p.title, p.posted_at AS posted_at, p.user_id AS postauthorid,
pu.first_names AS post_author_name,
c.content AS comment, c.user_id AS comment_author_id, c.posted_at,
cu.first_names AS comment_author_name
FROM posts AS p
JOIN users AS pu ON pu.id = p.user_id
JOIN comments AS c ON c.post_id = p.id
JOIN users AS cu ON cu.id = c.user_id
GROUP BY p.id, pu.first_names, c.content, c.user_id, cu.first_names, c.posted_at
ORDER BY p.id DESC, c.posted_at DESC;

Post.joins(:user, {comments: :user}).select("posts.id, posts.title, posts.posted_at, posts.user_id, users.first_names, comments.content, comments.user_id, comments.posted_at, users_comments.first_names AS comments_first_names")
