require 'faker'

Category.create(category: 'Mountaine')
Category.create(category: 'Sport')

User.create(
  email: 'busko.bogdan@gmail.com',
  password: '123456'
)

20.times do
  Bugcycle.create(
    name: Faker::Name.unique.name,
    description: 'FGHJKL:":LKJCsdhais djaksbd aksd aosdg asdasd haskdn aklsdjaksdh jajlsdh aosid haksdn alsdakjsd lasdakjsd alsdb aksjdhaksdhaksdh aksdj haskhdkasd',
    image: Rails.root.join('app/assets/images/default_image.png').open,
    user_id: User.first.id,
    category_id: Category.first.id
  )
end