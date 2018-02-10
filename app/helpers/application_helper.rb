module ApplicationHelper
    def current_class?(test)
      'active' if request.path.include?(test)
    end

    def check_landlord_id(params)
      if !params[:property].nil?
        params[:property][:landlord_id]
      elsif params[:landlord]
        params[:landlord]
      else
        return 0
      end
    end
end
