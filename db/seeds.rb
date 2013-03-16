# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lang.create([
  {
    id: 1,
    code: 'en'
  },
  {
    id: 2,
    code: 'ja'
  },
])

Category.create([
  {
    id: 1,
    slug: 'uncategorized',
    names: {
      en: 'Uncategorized',
      ja: '未分類',
    }
  },
])

# Fix PG::Error: ERROR:  duplicate key value violates unique constraint in test
ActiveRecord::Base.connection.execute "SELECT setval('langs_id_seq', (SELECT max(id) FROM langs));"
ActiveRecord::Base.connection.execute "SELECT setval('categories_id_seq', (SELECT max(id) FROM categories));"

