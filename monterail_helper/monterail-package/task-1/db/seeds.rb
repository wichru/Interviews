require "active_record"

require_relative "../models/user"
require_relative "../models/post"
require_relative "../models/comment"

# People

john = User.create(
  id: 1,
  birthday: Date.parse("1990-10-10"),
  first_names: "John",
  last_names: "Malycky",
)

mike = User.create(
  id: 2,
  birthday: Date.parse("1991-10-10"),
  first_names: "Mike",
  last_names: "Malycky",
)

chris = User.create(
  id: 3,
  birthday: Date.parse("2000-10-10"),
  first_names: "Christopher",
  last_names: "Smith",
)

# Post 1

post1 = Post.create(
  title: "How to be awesome!",
  content: "Just be me!",
  posted_at: Time.parse("2015-01-02 14:33"),
  user_id: john.id,
)

Comment.create(
  content: "I want to be awesome!",
  posted_at: Time.parse("2015-01-02 16:33"),
  user_id: chris.id,
  post_id: post1.id,
)

Comment.create(
  content: "Do you still want to be awesome!",
  posted_at: Time.parse("2015-01-10 14:33"),
  user_id: john.id,
  post_id: post1.id,
)

Comment.create(
  content: "I still want to be awesome!",
  posted_at: Time.parse("2015-01-10 16:33"),
  user_id: chris.id,
  post_id: post1.id,
)

Comment.create(
  content: "Ok.",
  posted_at: Time.parse("2015-01-10 18:13"),
  user_id: john.id,
  post_id: post1.id,
)

# Post 2

post2 = Post.create(
  title: "How to survive bad day.",
  content: "Sleep whole day.",
  posted_at: Time.parse("2015-01-10 12:33"),
  user_id: john.id,
)

Comment.create(
  content: "I have a really bad day",
  posted_at: Time.parse("2015-01-12 16:33"),
  user_id: mike.id,
  post_id: post2.id,
)

Comment.create(
  content: "This article is awesome!",
  posted_at: Time.parse("2015-01-12 14:33"),
  user_id: chris.id,
  post_id: post2.id,
)

Comment.create(
  content: "I ate broccoli.",
  posted_at: Time.parse("2015-01-14 16:33"),
  user_id: john.id,
  post_id: post2.id,
)

Comment.create(
  content: "And potateo.",
  posted_at: Time.parse("2015-01-14 16:34"),
  user_id: john.id,
  post_id: post2.id,
)

# Post 3

post3 = Post.create(
  title: "Look at that!",
  content: "Awesome stuff!",
  posted_at: Time.parse("2015-01-05 15:23"),
  user_id: mike.id,
)

Comment.create(
  content: "WoW!",
  posted_at: Time.parse("2015-01-06 16:33"),
  user_id: chris.id,
  post_id: post3.id,
)

Comment.create(
  content: "Boring...",
  posted_at: Time.parse("2015-01-10 14:33"),
  user_id: john.id,
  post_id: post3.id,
)
