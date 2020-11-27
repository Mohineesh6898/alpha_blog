class ArticlesController < ApplicationController
    def show
        @article=Article.find(params[:id])
    end    
    def index
        @article=Article.all
    end
    def new 
        @article=Article.new()
    end
    
    def create 
        # byebug
        @article=Article.new(params.require(:article).permit(:title,:description))
        if @article.save
            flash[:notice]="Article was succesfully created"
            redirect_to @article
        else
            render 'new'   
        end    
    end    
end    