require 'elasticsearch/model'

class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :title, :body, :author, :presence => true
  has_many :comments

  def self.search(query)
    __elasticsearch__.search(
        { "query": { "multi_match": { "query": query, "fields": ["title", "body"] }}}
    )
  end
end
