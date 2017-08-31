module ApplicationHelper
  def display_avatar(teacher)
     unless user.avatar.nil?
       image_tag(user.avatar.file_name)
     else
       image_tag("arya.png")
      end
   end
   ## ...
end
