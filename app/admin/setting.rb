ActiveAdmin.register Setting do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :id, :yearly_casual_leave, :yearly_sick_leave, :weekend_day_one, :weekend_day_two
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end



  index do
    column "Total casual leave hours", :yearly_casual_leave
    column "Total dick leave hours", :yearly_sick_leave
    column :weekend_day_one
    column :weekend_day_two
    actions :defaults => true
  end

  config.filters = false
  actions :all, :except => [:new, :destroy]

  form do |f|
    f.inputs "Settings" do

      f.input :yearly_casual_leave, label:"Total casual leave hours"
      f.input :yearly_sick_leave, label:"Total casual leave hours"
      f.input :weekend_day_one, :as => :select , :collection =>['saturday','sunday', 'monday', 'tuesday', 'wednessday', 'thursday', 'friday']
      f.input :weekend_day_two, :as => :select , :collection =>['saturday','sunday', 'monday', 'tuesday', 'wednessday', 'thursday', 'friday']
    end
    f.actions
  end




end
