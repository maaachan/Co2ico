# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Admin.create!(
   #email: ENV['ADMIN_EMAIL'],
   #password: ENV['ADMIN_PASSWORD']
#


Hushtag.create([
    { name: 'man'},
    { name: 'woman'},
    { name: 'unisex'},
    { name: '古着' },
    { name: 'セレクト' },
    { name: 'vintage'},
    { name: 'ハイブランド取り扱い'},
    { name: '入りやすさ◎'},
    { name: '入りにくい'},
    { name: '店員が追いかけてこない'},
    { name: '取り扱い商品が多い'},
    { name: 'スタッフの数◎'},
    { name: 'スタッフが少ない'},
    ])
