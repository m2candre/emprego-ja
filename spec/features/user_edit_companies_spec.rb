require 'rails_helper'

feature 'User edit companies' do

  scenario 'successfully' do
    campus_code = Company.create(name: 'Campus Code',
                                 location: 'São Paulo',
                                 mail: 'contato@campus.com.br',
                                 phone: '2369-3476')

    locaweb     = Company.create(name: 'Locaweb',
                                 location: 'São Paulo',
                                 mail: 'contato@locaweb.com.br',
                                 phone: '2222-3333')

    visit edit_company_path(campus_code)

    fill_in 'Nome',     with: locaweb.name
    fill_in 'Local',    with: locaweb.location
    fill_in 'Email',    with: locaweb.mail
    fill_in 'Telefone', with: locaweb.phone

    click_on 'Atualizar Empresa'

    expect(page).to have_content locaweb.name
    expect(page).to have_content locaweb.location
    expect(page).to have_content locaweb.mail
    expect(page).to have_content locaweb.phone
  end

  scenario 'and change company' do
    campus_code = Company.create(name: 'Campus Code',
                                 location: 'São Paulo',
                                 mail: 'contato@campus.com.br',
                                 phone: '2369-3476')

    locaweb     = Company.create(name: 'Locaweb',
                                 location: 'São Paulo',
                                 mail: 'contato@locaweb.com.br',
                                 phone: '2222-3333')

    visit edit_company_path(campus_code)

    fill_in 'Nome',     with: locaweb.name

    click_on 'Atualizar Empresa'

    expect(page).to have_content locaweb.name
    expect(page).to have_content campus_code.location
    expect(page).to have_content campus_code.mail
    expect(page).to have_content campus_code.phone
  end

  scenario 'with valida data' do
    campus_code = Company.create(name: 'Campus Code',
                                 location: 'São Paulo',
                                 mail: 'contato@campus.com.br',
                                 phone: '2369-3476')


    visit edit_company_path(campus_code)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Não foi possível atualizar a empresa'
  end
end
