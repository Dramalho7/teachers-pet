module TeachersHelper
  def resource_name
      current_teacher.name || :teacher
    end

    def resource
      # @resource ||= User.new
      @resource ||= current_teacher
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:teacher]
    end
end
