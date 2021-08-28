40.times do |i|
  Post.seed do |s|
    s.user_id = User.pluck(:id).sample
    s.title = Faker::Book.title
    s.opinion = "面白かった！！"
  end
end