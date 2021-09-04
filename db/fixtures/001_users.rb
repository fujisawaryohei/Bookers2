User.seed do |s|
  s.id = 1
  s.name = 'user1'
  s.introduction = 'よろしくお願いします'
  s.email = 'user1@example.com'
  s.password = 'test1234'
end

User.seed do |s|
  s.id = 2
  s.name = 'user2'
  s.introduction = 'よろしくおねがいします'
  s.email = 'user2@example.com'
  s.password = 'test1234'
end
