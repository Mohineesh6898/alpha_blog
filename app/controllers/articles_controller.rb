class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    before_action :req_user,except:[:show,:index]
    before_action :same_user_req,only: [:edit,:delete]
    def show
    end    
    def index
        @article=Article.paginate(page: params[:page], per_page: 3)

    end
    def new
        if logged_in?
            @article=Article.new()  
        else
            redirect_to signup_path
        end          
    end
    
    def create 
        # byebug
        @article=Article.new(article_params)
        @article.user=current_user
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
    def same_user_req
        if current_user!=@article.user
            flash[:alert]="You can only edit your articles"
            redirect_to @article
        end    
    end    
end    