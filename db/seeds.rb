# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

if User.count <= 0 and Role.count <= 0
  admin=Role.create({role: 'admin', description: 'Admin Role'})
  user=Role.create({role: 'user', description: 'User Role'})
  user1=User.create({name: 'Admin', email: 'admin@admin.tld', password:'test1234', :roles => [admin,user]})
  user2=User.create({name: 'SAdig',email: 'sh@sourcecode.de', password: 'test1234', :roles => [user]})
  user3=User.create({name: 'Test User',email: 'test@test.tld', password: 'test1234', :roles => [user]})
  project=Project.create({slug: 'test_project', title: 'First test Project for testuser', description:'testing foo', owner: user3})
end
