ActiveAdmin.register Post do

  def scoped_collection
    if current_admin_user.role != 'admin'
      city = City.find(current_admin_user.city_id)
      Post.where(city: city)
    end
  end
  
end
