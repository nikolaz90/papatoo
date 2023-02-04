class ArticleVocabularyFlagger
  def self.find_articles_with_inappropriate_language
    @articles = Article.where("content LIKE ?", "%beginning%")
  end
end
