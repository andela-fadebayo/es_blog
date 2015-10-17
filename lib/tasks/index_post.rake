require 'elasticsearch/model'

namespace :es_post do
  desc 'This task indexes all customer leads into ElasticSearch'
  task index_all: :environment do
    puts 'This task indexes all posts into ElasticSearch'
    health = Post.__elasticsearch__.client.cluster.health

    puts "cluster health #{health}"

    puts "Indexing posts. Processing..."

    Post.__elasticsearch__.create_index! force: true
    Post.__elasticsearch__.refresh_index!

    puts "Done indexing"

    puts 'Importing post from DB to Elasticsearch...'

    Post.__elasticsearch__.import

    puts "Done!!!"
  end

  task delete: :environment do
    puts 'This task deletes posts index'

    Post.__elasticsearch__.client.indices.delete index: 'posts'

    puts 'Done deleting index.'
  end
end