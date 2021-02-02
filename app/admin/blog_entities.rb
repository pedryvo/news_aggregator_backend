ActiveAdmin.register BlogEntity do

  before_create do |blog_entity|
    blog_entity.city = City.find(current_admin_user.city_id)
  end

  def scoped_collection
    if current_admin_user.role != 'admin'
      city = City.find(current_admin_user.city_id)
      BlogEntity.where(city: city)
    end
  end
  
  permit_params :name, :base_url

  form do |f|
    f.inputs "BlogEntity" do
      f.input :name
      f.input :base_url
    end
    f.actions
  end
end
