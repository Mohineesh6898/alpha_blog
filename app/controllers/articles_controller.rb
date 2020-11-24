class ArticlesController < ApplicationController
    def show
        @article=Article.find(params[:id])
    end    
    def index
        @article=Article.all
    end
    def new 
        
    end
    
    def create 
        # byebug
        @article1=Article.new(params.require(:article).permit(:title,:description))
        @article1.save
        
        redirect_to @article1
    end    
end    