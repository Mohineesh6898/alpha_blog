class UsersController<ApplicationController
    def new
        @user=User.new()
    end
    def create
       @user=User.new(params.require(:user).permit(:username,:email,:password)) 
       if @user.save
        flash[:notice]="Welcome to the blog #{@user.username}"
        @user.save
        redirect_to articles_path
       else
        render 'new'
       end  
    end    
    def index
        @user=User.all
    end    
    def show
        @user=User.find(params[:id])
    end    
end