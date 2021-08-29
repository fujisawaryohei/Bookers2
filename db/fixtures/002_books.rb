40.times do |i|
  Book.seed do |s|
    s.user_id = User.pluck(:id).sample
    s.title = Faker::Book.title
    s.body = "面白かった！！"
  end
end