class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    def show
    end    
    def index
        @article=Article.all
    end
    def new 
        @article=Article.new()
    end
    
    def create 
        # byebug
        @article=Article.new(article_params)
        if @article.save
            flash[:notice]="Article was succesfully created"
            redirect_to @article
        else
            flash[:warning]="Retry"
            render 'new'   
        end    
    end    
    def edit
    end
    def update
        if @article.update(article_params)
            flash[:notice]="Article updated"
            redirect_to @article
        else
            render 'edit'
        end        
    end    
    def destroy
         @article.destroy
        redirect_to articles_path
    end    

    private
    def set_article
        @article=Article.find(params[:id])
    end    

    def article_params
        params.require(:article).permit(:title,:description)
    end   
end    