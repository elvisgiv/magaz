require "rails_helper"

RSpec.describe "Search products" do

	context 'in taxon' do

		it "open .." do
			visit "/"
			expect(page).to have_selector("h1", :text => 'Welcome to the MaGaz')
			page.has_css?('table.table')
#=begin 	
			within('table.table') do #все, что находится внутри аштмльного объекта будет искаться именно для этого объекта, в нашем случае ищутся ссылки именно в таблице, а не по всей странице
				all('a').each do |a|
					puts a[:href]
					expect(a[:href]).to match(/product\/\d+/)
				end
			end

			all('a').each do |a|
				puts a[:href]
				expect(a[:href]).to match(/\w/)
			end
			#expect(page).to have_selector("h1", :text => 'Welcome to the MaGaz')
			find_link('Category').visible?
			find_link('Product').visible?
			click_link('Category')
				expect(page).to have_selector("h1", :text => 'Categories')
				expect(page).to have_content("Количество товаров в корзине")
				click_link('fruits')
				click_link('berries')
				click_link('rowan')
				fill_in('q', :with => 13)
				click_button('add to cart')
				expect(page).to have_content("ПРОДУКТ ДОБАВИЛИ")
				click_link('Cart')
				page.has_css?('table.table')
				within('table.table') do #все, что находится внутри аштмльного объекта будет искаться именно для этого объекта, в нашем случае ищутся ссылки именно в таблице, а не по всей странице
					expect(page).to have_content("rowan")
					expect(page).to have_content("3.33")
					#expect(page).to have_content("13")
					expect(page).to have_content("43.29")
				end				
				click_button('checkout')
				fill_in('Name', :with => 'John')
				fill_in('Phone', :with => 12345)
				fill_in('Email', :with => 'maxis.thegenius@gmail.com')
				select('Kharkov', :from => 'Shipping method')
				click_button('Submit')
				expect(page).to have_content("Ваш заказ был принят и в ближайшие секунды наши менеджеры свяжутся и обтяпают с Вами дельце!!! Спасибо!")



			visit "/"
			click_link('Product')



#=end
			#all("table.table a").each do |a|
				#h = a[:href].to_s
			#	puts h
				#expect(h).to eq('product')
				
			#end
		end
	end
end

#rspec 'spec/features/cart_spec.rb'