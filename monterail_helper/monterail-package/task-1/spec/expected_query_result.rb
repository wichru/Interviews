EXPECTED_QUERY_RESULT = [
  {
    id: 2,
    title: "How to survive bad day.",
    content: "Sleep whole day.",
    posted_at: Time.parse("2015-01-10 12:33:00"),
    last_comment_at: Time.parse("2015-01-14 16:34:00"),
    number_of_comments: 4,
    author: {
      id: 1,
      first_names: "John",
      last_names: "Malycky"
    },
    comments: [
      {
        content: "This article is awesome!",
        posted_at: Time.parse("2015-01-12 14:33:00"),
        author: {
          id: 3,
          full_name: "Christopher Smith",
          age: 17,
          number_of_comments: 4
        }
      },
      {
        content: "I have a really bad day",
        posted_at: Time.parse("2015-01-12 16:33:00"),
        author: {
          id: 2,
          full_name: "Mike Malycky",
          age: 26,
          number_of_comments: 1
        }
      },
      {
        content: "I ate broccoli.",
        posted_at: Time.parse("2015-01-14 16:33:00"),
        author: {
          id: 1,
          full_name: "John Malycky",
          age: 27,
          number_of_comments: 5
        }
      },
      {
        content: "And potateo.",
        posted_at: Time.parse("2015-01-14 16:34:00"),
        author: {
          id: 1,
          full_name: "John Malycky",
          age: 27,
          number_of_comments: 5
        }
      }
    ]
  },
  {
    id: 3,
    title: "Look at that!",
    content: "Awesome stuff!",
    posted_at: Time.parse("2015-01-05 15:23:00"),
    last_comment_at: Time.parse("2015-01-10 14:33:00"),
    number_of_comments: 2,
    author: {
      id: 2,
      first_names: "Mike",
      last_names: "Malycky"
    },
    comments: [
      {
        content: "WoW!",
        posted_at: Time.parse("2015-01-06 16:33:00"),
        author: {
          id: 3,
          full_name: "Christopher Smith",
          age: 17,
          number_of_comments: 4
        }
      },
      {
        content: "Boring...",
        posted_at: Time.parse("2015-01-10 14:33:00"),
        author: {
          id: 1,
          full_name: "John Malycky",
          age: 27,
          number_of_comments: 5
        }
      }
    ]
  },
  {
    id: 1,
    title: "How to be awesome!",
    content: "Just be me!",
    posted_at: Time.parse("2015-01-02 14:33:00"),
    last_comment_at: Time.parse("2015-01-10 18:13:00"),
    number_of_comments: 4,
    author: {
      id: 1,
      first_names: "John",
      last_names: "Malycky"
    },
    comments: [
      {
        content: "I want to be awesome!",
        posted_at: Time.parse("2015-01-02 16:33:00"),
        author: {
          id: 3,
          full_name: "Christopher Smith",
          age: 17,
          number_of_comments: 4
        }
      },
      {
        content: "Do you still want to be awesome!",
        posted_at: Time.parse("2015-01-10 14:33:00"),
        author: {
          id: 1,
          full_name: "John Malycky",
          age: 27,
          number_of_comments: 5
        }
      },
      {
        content: "I still want to be awesome!",
        posted_at: Time.parse("2015-01-10 16:33:00"),
        author: {
          id: 3,
          full_name: "Christopher Smith",
          age: 17,
          number_of_comments: 4
        }
      },
      {
        content: "Ok.",
        posted_at: Time.parse("2015-01-10 18:13:00"),
        author: {
          id: 1,
          full_name: "John Malycky",
          age: 27,
          number_of_comments: 5
        }
      }
    ]
  }
]
