class ArticleVocabularyFlagger
  def self.find_articles_with_inappropriate_language
    bad_words = ["looser", "shit", "tosser"].join(' ')
    Article.search_title_and_content(bad_words)
  end
end
