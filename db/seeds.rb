include RandomData

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(
  title: "I love hockey",
  body: "Hockey is the best sport in the world!"
)

Comment.find_or_create_by(
  body: "What in the world has happened!"
)


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
