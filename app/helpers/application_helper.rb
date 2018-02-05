module ApplicationHelper
    def current_class?(test)
    'active' if request.path.include?(test)
  end
end
