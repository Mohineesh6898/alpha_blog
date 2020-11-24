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
        
    end    
end    