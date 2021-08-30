module StatusesHelper
    def active(bug)
        session[:bug_id] = bug.id
    end
    
    def active_bug
        if session[:bug_id]
            @active_bug ||= Bug.find_by(id: session[:bug_id])
        end
    end
    
    def active?
        !active_bug.nil?
    end

    def deactive
        session.delete(:bug_id)
        @active_bug = nil
    end
end
