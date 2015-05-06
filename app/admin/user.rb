ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :total_sick_left, :total_sick_consume, :total_casual_left, :total_casual_consume, :ttf_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  menu label: "Employees"
  filter :email


  index do
    column :email
    column 'Sick Left', :total_sick_left
    column 'Sick Consumed', :total_sick_consume
    column 'Casual Left', :total_casual_left
    column 'Casual Consumed', :total_casual_consume
    column 'TTF', :ttf_id do |u|
      if u.ttf_id.present? && u.ttf_id > 0
        User.find(u.ttf_id).email
      else
        'None'
      end
    end
  end
end
