DROP TABLE users;
DROP TABLE posts;
DROP TABLE comments;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  birthday DATE
  first_names VARCHAR,
  last_names VARCHAR,
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY
  title VARCHAR,
  content VARCHAR,
  posted_at DATETIME,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE comments (
  content VARCHAR,
  posted_at DATETIME,
  FOREIGN KEY post_id REFERENCES post(id)
  FOREIGN KEY user_id REFERENCES user(id)
);

INSERT INTO users(id, birthday, first_names, last_names) VALUES (1, Date.parse("1990-10-10"), 'John', 'Malycky')
INSERT INTO users(id, birthday, first_names, last_names) VALUES (2, Date.parse("1991-10-10"), 'Mike', 'Malycky')
INSERT INTO users(id, birthday, first_names, last_names) VALUES (1, Date.parse("2000-10-10"), 'Christopher', 'Smith')

INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (1, "How to be awesome!", "Just be me!", Time.parse("2015-01-02 14:33"), user(1))
INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (1, "How to be awesome!", "Just be me!", Time.parse("2015-01-02 14:33"), user(1))
INSERT INTO posts(id, title, content, posted_at, user_id) VALUES (1, "How to be awesome!", "Just be me!", Time.parse("2015-01-02 14:33"), user(1))
