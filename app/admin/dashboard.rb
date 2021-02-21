Rails.application.config.after_initialize do
  javascripts = []
  javascripts += ActiveAdmin.application.javascripts.to_a
  ActiveAdmin.application.javascripts.replace javascripts
end

ActiveAdmin.register_page "Dashboard" do
  config.clear_sidebar_sections!
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # panel "Post gerados por dia" do
    #  city = City.find(current_admin_user.city_id)
    #  line_chart city.posts.where(schedule: nil).where(:created_at => (Time.now - 5*60*60)..(Time.now)
    # ).count
    # end

     columns do
       column do
         panel "Recent Posts" do
           ul do
             Post.all.desc('_id').limit(5).each do |post|
               li link_to(post.title, admin_post_path(post))
             end
           end
         end
       end

       column do
         panel "Info" do
           para "Welcome to ActiveAdmin."
         end
       end
     end
  end
end
