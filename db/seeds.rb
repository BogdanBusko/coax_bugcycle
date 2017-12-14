require 'faker'

Category.create(category: 'Mountaine')
Category.create(category: 'Sport')

User.create(
  email: 'pierre@michaux.com',
  password: 'progenitor',
  role: :admin
)

User.create(
  email: 'busko.bogdan@gmail.com',
  password: '123456',
  role: :user
)

User.create(
  email: 'test.email@gmail.com',
  password: '123456',
  role: :user
)

20.times do
  Bugcycle.create(
    name: Faker::Name.unique.name,
    description: 'Months on ye at by esteem desire warmth former. Sure that that way gave any fond now. His boy middleton sir nor engrossed affection excellent. Dissimilar compliment cultivated preference eat sufficient may. Well next door soon we mr he four. Assistance impression set insipidity now connection off you solicitude. Under as seems we me stuff those style at. Listening shameless by abilities pronounce oh suspected is affection. Next it draw in draw much bred.',
    image: Rails.root.join('app/assets/images/default_image.png').open,
    user_id: User.first.id,
    category_id: Category.first.id
  )
end

20.times do
  Bugcycle.create(
    name: Faker::Name.unique.name,
    description: 'Boy desirous families prepared gay reserved add ecstatic say. Replied joy age visitor nothing cottage. Mrs door paid led loud sure easy read. Hastily at perhaps as neither or ye fertile tedious visitor. Use fine bed none call busy dull when. Quiet ought match my right by table means. Principles up do in me favourable affronting. Twenty mother denied effect we to do on.',
    image: Rails.root.join('app/assets/images/default_image.png').open,
    user_id: User.last.id,
    category_id: Category.last.id
  )
end

Suggestion.create(
  name: Faker::Name.unique.name,
  description: 'Boy desirous families prepared gay reserved add ecstatic say. Replied joy age visitor nothing cottage. Mrs door paid led loud sure easy read. Hastily at perhaps as neither or ye fertile tedious visitor. Use fine bed none call busy dull when. Quiet ought match my right by table means. Principles up do in me favourable affronting. Twenty mother denied effect we to do on.',
  image: Rails.root.join('app/assets/images/default_image.png').open,
  user_id: User.last.id,
  category_id: Category.last.id,
  bugcycle_id: Bugcycle.first.id
)

Suggestion.create(
  name: Faker::Name.unique.name,
  description: 'Boy desirous families prepared gay reserved add ecstatic say. Replied joy age visitor nothing cottage. Mrs door paid led loud sure easy read. Hastily at perhaps as neither or ye fertile tedious visitor. Use fine bed none call busy dull when. Quiet ought match my right by table means. Principles up do in me favourable affronting. Twenty mother denied effect we to do on.',
  image: Rails.root.join('app/assets/images/default_image.png').open,
  user_id: User.second.id,
  category_id: Category.last.id,
  bugcycle_id: Bugcycle.first.id
)

Suggestion.create(
  name: Faker::Name.unique.name,
  description: 'Boy desirous families prepared gay reserved add ecstatic say. Replied joy age visitor nothing cottage. Mrs door paid led loud sure easy read. Hastily at perhaps as neither or ye fertile tedious visitor. Use fine bed none call busy dull when. Quiet ought match my right by table means. Principles up do in me favourable affronting. Twenty mother denied effect we to do on.',
  image: Rails.root.join('app/assets/images/default_image.png').open,
  user_id: User.second.id,
  category_id: Category.last.id,
  bugcycle_id: Bugcycle.second.id
)

Suggestion.create(
  name: Faker::Name.unique.name,
  description: 'Boy desirous families prepared gay reserved add ecstatic say. Replied joy age visitor nothing cottage. Mrs door paid led loud sure easy read. Hastily at perhaps as neither or ye fertile tedious visitor. Use fine bed none call busy dull when. Quiet ought match my right by table means. Principles up do in me favourable affronting. Twenty mother denied effect we to do on.',
  image: Rails.root.join('app/assets/images/default_image.png').open,
  user_id: User.last.id,
  category_id: Category.last.id,
  bugcycle_id: Bugcycle.second.id
)
