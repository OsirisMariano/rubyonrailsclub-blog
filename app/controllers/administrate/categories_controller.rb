# frozen_string_literal: true

module Administrate
  class CategoriesController < AdministrateController
    # before_action :set_article, only: [:show, :edit, :update, :destroy, :destroy_cover_image]
    # before_action :set_categories, only: [:edit, :new, :show]
    # # GET /categories or /categories.json
    def index
      @categories = Category.all
    end

    # GET /categories/1 or /categories/1.json
    # def show
    # end

    # # GET /categories/new
    def new
      @category = Category.new
    end

    # # GET /categories/1/edit
    # def edit
    # end

    # # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to(administrate_category_url(@category), notice: "Categoria criada com sucesso!") }
          format.json { render(:show, status: :created, location: @category) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @category.errors, status: :unprocessable_entity) }
        end
      end
    end

    # # PATCH/PUT /articles/1 or /articles/1.json
    # def update
    #   respond_to do |format|
    #     if @article.update(article_params)
    #       format.html { redirect_to(administrate_article_url(@article), notice: "Article was successfully updated.") }
    #       format.json { render(:show, status: :ok, location: @article) }
    #     else
    #       format.html { render(:edit, status: :unprocessable_entity) }
    #       format.json { render(json: @article.errors, status: :unprocessable_entity) }
    #     end
    #   end
    # end

    # # DELETE /articles/1 or /articles/1.json
    # def destroy
    #   @article.destroy!

    #   respond_to do |format|
    #     format.html { redirect_to(administrate_articles_url, notice: "Article was successfully destroyed.") }
    #     format.json { head(:no_content) }
    #   end
    # end

    # def destroy_cover_image
    #   @article.cover_image.purge

    #   respond_to do |format|
    #     format.turbo_stream { render(turbo_stream: turbo_stream.remove(@article)) }
    #   end
    # end

    # private

    # def set_categories
    #   @categories = Category.all
    # end

    # # Use callbacks to share common setup or constraints between actions.
    # def set_article
    #   @article = Article.friendly.find(params[:id])
    # end

    # # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
  end
end
