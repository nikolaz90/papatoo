
puts 'creating articles...'
Article.create!(
  title: "Article one",
  content: "content about article one",
  status: "draft",
  category: "food",
  user: User.where(email: "123@dev.com").first
)

Article.create!(
  title: "Article twoz",
  content: "content about article deux",
  category: "food",
  user: User.where(email: "123@dev.com").first
)
