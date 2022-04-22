module Api
    module V1
        class MenusController < ApplicationController
            def index
                menus = Menu.all

                render json: MenuSerializer.new(menus, options).serialized_json
            end

            def show 
                menu = Menu.find_by(id: params[:id])

                render json: MenuSerializer.new(menu, options).serialized_json
            end

            def create 
                menu = Menu.new(menu_params)

                if menu.save
                    params[:menus_categories].each do |menu_category|
                        category = Category.find_by(id: menu_category[:category_id])
                        menu_categories = MenusCategory.new(menu_id: menu.id, category_id: category.id)
                        menu_categories.save
                    end
                    
                    render json: MenuSerializer.new(menu, options).serialized_json
                else
                    render json: { error: menu.errors.messages }, status: 422
                end
            end

            def update
                menu = Menu.find_by(id: params[:id])

                if menu.update(menu_params) && params[:menus_categories]
                    MenusCategory.where(menu_id: menu.id).delete_all

                    params[:menus_categories].each do |menu_category|
                        category = Category.find_by(id: menu_category[:category_id])
                        menu_categories = MenusCategory.new(menu_id: menu.id, category_id: category.id)
                        menu_categories.save
                    end

                    render json: MenuSerializer.new(menu, options).serialized_json
                elsif menu.update(menu_params)
                    render json: MenuSerializer.new(menu, options).serialized_json
                elsif params[:menus_categories]
                    MenusCategory.where(menu_id: menu.id).delete_all

                    params[:menus_categories].each do |menu_category|
                        category = Category.find_by(id: menu_category[:category_id])
                        menu_categories = MenusCategory.new(menu_id: menu.id, category_id: category.id)
                        menu_categories.save
                    end
                    
                    render json: MenuSerializer.new(menu, options).serialized_json
                else
                    render json: { error: menu.errors.messages }, status: 422
                end
            end

            def destroy
                menu = Menu.find_by(id: params[:id])
                MenusCategory.where(menu_id: menu.id).delete_all
                OrderDetail.where(menu_id: menu.id).delete_all

                if menu.destroy
                    head :no_content
                else
                    render json: { errors: menu.errors.messages }, status: 422
                end
            end

            private

            def menu_params
                params.require(:menu).permit(:name, :price, :description)
            end

            def options
                @options ||= { include: %i[categories] }
            end
        end
    end
end