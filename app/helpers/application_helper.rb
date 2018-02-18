module ApplicationHelper
    def current_class?(test)
      request.path.include?(test) ? 'active' : ''
    end

    def check_landlord_id(params)
      if !params[:property].nil?
        params[:property][:landlord_id]
      elsif params[:landlord]
        params[:landlord]
      elsif @landlord
        @landlord.id
      else
        return 0
      end
    end
end
