DROP TABLE comments;
DROP TABLE posts;
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  birthday INTEGER,
  first_names VARCHAR,
  last_names VARCHAR
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  title VARCHAR,
  content VARCHAR,
  posted_at INTEGER,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
  content VARCHAR,
  posted_at INTEGER,
  post_id INTEGER,
  user_id INTEGER,
  FOREIGN KEY (post_id) REFERENCES posts(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users(id, birthday, first_names, last_names) VALUES (1, 1990-10-10, 'John', 'Doe');
INSERT INTO users(id, birthday, first_names, last_names) VALUES (2, 1991-10-10, 'Mike', 'Malycky');
INSERT INTO users(id, birthday, first_names, last_names) VALUES (3, 2000-10-10, 'Christopher', 'Smith');

INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (1, 'How to be awesome!', 'Just be me!', 2015-01-02, 1);
INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (2, 'How to survive bad day.', 'Sleep whole day.', 2015-01-10, 1);
INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (3, 'Look at that!', 'Awesome stuff!', 2015-01-05, 2);

INSERT INTO comments(content, posted_at, post_id, user_id) VALUES ('I want to be awesome!', 2015-01-02, 3, 1);
INSERT INTO comments(content, posted_at, post_id, user_id) VALUES ('awesome!', 2015-01-10, 1, 1);
INSERT INTO comments(content, posted_at, post_id, user_id) VALUES ('And potateo.', 2015-01-14, 1, 2);
INSERT INTO comments(content, posted_at, post_id, user_id) VALUES ('WoW!', 2015-01-06, 3, 3);
