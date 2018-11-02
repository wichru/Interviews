SELECT p.id, p.title, p.content AS post, p.user_id AS postauthorid, COUNT(*) AS number_of_comments,
pu.first_names AS post_author_name,
c.content AS comment, c.user_id AS comment_author_id,
cu.first_names AS comment_author_name
FROM posts AS p
JOIN users AS pu ON pu.id = p.user_id
JOIN comments AS c ON c.post_id = p.id
JOIN users AS cu ON cu.id = c.user_id;
