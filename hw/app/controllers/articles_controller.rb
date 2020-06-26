class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end
    
    def create
        # render plain: params[:article]
#         form으로 부터 전달된 field들에 접근할 수 있게 한다.
#  ActiveSupport::HashWithIndifferentAccess object를 리턴한다.
# render에 전달된 contents를 client로 응답한다.
        @article = Article.new(article_params)
            if @article.save
            redirect_to @article
            else
            render 'new'
            end
        end
    
    def show
        @article = Article.find(params[:id])
    end 
    
    def index
        @articles = Article.all
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
private
    def article_params
    params.require(:article).permit(:title, :text)
    end
    


end
