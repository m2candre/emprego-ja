# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

compCampus = Company.create(name: 'Campus Code', location: 'São Paulo', mail: 'contato@campus.com.br' , phone: '2369-3476')
compLoca   = Company.create(name: 'Locaweb'    , location: 'São Paulo', mail: 'contato@locaweb.com.br', phone: '3333-3333')

catDev = Category.create(name: 'Desenvolvedor')
catFrt = Category.create(name: 'Front-End')
catSys = Category.create(name: 'SysAdmin')
catSup = Category.create(name: 'Suporte')

Category.create(name: 'Programador')
Category.create(name: 'Back-End')


Job.create(title: 'Dev Master', category: catDev, company: compCampus, location: 'Rio de Janeiro', description: 'Vaga para Dev Master para Bootcamp Rails')
Job.create(title: 'SysAdmin'  , category: catSys, company: compCampus, location: 'Rio de Janeiro', description: 'Administrador de sistema')
Job.create(title: 'Suporte'   , category: catSup, company: compLoca  , location: 'São Paulo'     , description: 'Atendimento ao cliente')
Job.create(title: 'Web Dev'   , category: catFrt, company: compLoca  , location: 'São Paulo'     , description: 'Vaga para Desenvolvedor Web')
