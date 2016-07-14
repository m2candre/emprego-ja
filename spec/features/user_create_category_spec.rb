require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do
    category = Category.new(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Nome', with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'invalid' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'Não foi possível criar a categoria'
  end

end
