class DashboardsController < ApplicationController

    def index
        if params[:option] == "A" || params[:option] == nil
                @notifications = Notification.recent(current_user.last_logout_at)
        elsif params[:option] == "B"
                @notifications = Notification.recent(current_user.last_logout_at).where(notificable_type: "Board")
        elsif params[:option] =- "O"
                @notifications = Notification.recent(current_user.last_logout_at).where(notificable_type: "Comment")
        end
        
    end
end
