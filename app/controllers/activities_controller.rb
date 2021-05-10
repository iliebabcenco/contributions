class ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
    end
    def new
        @activity = Activity.new
        # id = session[:current_user_id]
        # @user = User.find(id) unless id.nil?
    end
    def create_personal

        @user = current_user
        @activity = @user.activities.build(activity_personal_params)
        if @activity.save
            redirect_to root_path, notice: 'Your activity was successfuly created!'
        else
            render :new, alert: "Something wrong"
        end
        
    end

    def create_external

        @user = current_user
        @activity = @user.activities.build(activity_external_params)
        if @activity.save
            redirect_to root_path, notice: 'Your activity was successfuly created!'
        else
            render :new, alert: "Something wrong"
        end
        
    end

    private

    def activity_personal_params
        params.require(:activity).permit([:name, :amount])
    end

    def activity_external_params
        params.require(:activity).permit([:name, :amount, :group_id])
    end

end
