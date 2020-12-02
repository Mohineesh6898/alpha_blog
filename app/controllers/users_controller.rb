class UsersController<ApplicationController
    before_action :req_user,only:[:edit,:update]
    def new
        @user=User.new()
    end
    def create
       @user=User.new(params.require(:user).permit(:username,:email,:password)) 
       if @user.save
        session[:user_id]=@user.id
        flash[:notice]="Welcome to the blog #{@user.username}"
        @user.save
        redirect_to users_path
       else
        render 'new'
       end  
    end    
    def index
        @user=User.paginate(page:params[:page],per_page:30)
    end    
    def show
        @user=User.find(params[:id])
    end    
    def edit
        @user=User.find(params[:id])
    end
    def update
        @user=User.find(params[:id])
        if @user.update(params.require(:user).permit(:username,:email,:password))
            flash[:notice]="USer updated #{@user.username}      "
            redirect_to users_path
        else
            render 'edit' 
        end       
    end   
    def destroy
        @user=User.find(params[:id])     
        @user.destroy
        session[:user_id]=nil
        
        flash[:notice]="User Deleted"
        redirect_to articles_path
    end    
end