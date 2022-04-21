module Api
    module V1
        class MenusCategoriesController < ApplicationController
            def create 
                menu_category = MenusCategory.new(menu_category_params)

                if menu_category.save
                    render json: MenusCategorySerializer.new(menu_category).serialized_json
                else
                    render json: { error: menu_category.errors.messages }, status: 422
                end
            end

            def update
                menu_category = MenusCategory.find_by(id: params[:id])

                if menu_category.update(menu_category_params)
                    render json: MenusCategorySerializer.new(menu_category).serialized_json
                else
                    render json: { error: menu_category.errors.messages }, status: 422
                end
            end

            def destroy
                menu_category = MenusCategory.find_by(id: params[:id])

                if menu_category.destroy
                    head :no_content
                else
                    render json: { errors: menu_category.errors.messages }, status: 422
                end
            end

            private

            def menu_category_params
                params.require(:menus_category).permit(:menu_id, :category_id)
            end

            # def options
            #     @options ||= { include: %i[menus] }
            # end
        end
    end
end