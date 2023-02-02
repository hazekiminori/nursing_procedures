# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!(
  [
    {email: 'test1@test', name: '佐藤太郎', staff_number: '123', password: 'password'},
    {email: 'test2@test', name: '田中二郎', staff_number: '456', password: 'password'},
    {email: 'test3@test', name: '鈴木花子', staff_number: '789', password: 'password'}
  ]
)

Category.create!(
  [
   {name: '新生児', id: '1'},
   {name: '検査', id: '2'}
  ]
)

Procedure.create!(
  [
    {title: 'K2シロップ内服', necessity_item: 'K2シロップ、乳首', 
     body: 'シロップの処方をダブルチェック。児に嘔気がないことを確認する。嘔気がない場合は、乳首を用いてシロップを内服させる。
     その後、排気をして嘔吐がないか確認する。', 
     image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), 
     filename:"sample-post1.jpg"), user_id: users[0].id ,category_id: '1'},
    {title: 'GBS検査', necessity_item: '滅菌スピッツ、滅菌綿棒', 
     body: 'キャップにGBS検体だとわかるように記載する。検査ラベルとスピッツに間違いがないかダブルチェックする。
     検査ラベルと患者バーコードをPDAで照合する。医師へ必要物品を滅菌操作で渡す。検体を提出する。', 
     image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), 
     filename:"sample-post2.jpg"), user_id: users[1].id, category_id: '2' },
  ]
)

Admin.create!(
  email: 'admin@admin',
  password: 'testtest')