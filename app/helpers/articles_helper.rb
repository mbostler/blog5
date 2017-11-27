module ArticlesHelper
  def byline( article )
    parts = []
    parts << "Posted #{time_ago_in_words( article.created_at)} ago" if !!article.updated_at
    parts << "by #{article.author.name}" if article.author
    parts.join " "
  end
end
