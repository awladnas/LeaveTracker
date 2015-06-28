ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :total_sick_left, :total_sick_consume, :total_casual_left, :total_casual_consume, :supervisor
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
    column 'TTF', :supervisor do |u|
      if u.supervisor.present? && u.supervisor > 0
        User.find(u.supervisor).email
      else
        'None'
      end
    end
  end
end
