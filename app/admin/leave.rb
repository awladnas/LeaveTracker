ActiveAdmin.register Leave do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :id, :leave_type, :start_date, :end_date, :user_id, :leave_status, :content
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end



  filter :start_date, :label => "Apply Date", :as => :date_range
  filter :leave_type, :as => :select
  filter :leave_status, :as => :select

  index do
    column :user, :sortable => 'users.email' do |leave|
      leave.user.email
    end
    column :leave_type
    column :leave_status do |leave|
     if leave.leave_status == 'PENDING'
       "<span class=\" text-success\"> #{leave.leave_status} </span>".html_safe
     else
       "<span class=\" text-success\"> #{leave.leave_status} </span>".html_safe
     end
    end
    column :start_date
    column :end_date
    column :content
    column :total_days
    column :total_minutes
    actions :defaults => true
  end

  controller do
    def scoped_collection
      super.includes [:user]
    end

    def update
      if ["ACCEPT", "REJECT"].include?(params[:leave][:leave_status])
         leave = Leave.find(params[:id])
         LeaveMailer::confirmed_leave(leave).deliver!
      end

      update! do |format|
        format.html { redirect_to admin_leaves_path }
      end
    end

  end

  actions :all, :except => [:destroy]

  form do |f|
    f.inputs "New Leave" do
      f.inputs "User" do
        "<div>
        #{f.object.user.email}
        </div>".html_safe
      end

      f.input :leave_type, :input_html => { :disabled => true }
      f.input :start_date, :input_html => { :disabled => true }
      f.input :end_date, :input_html => { :disabled => true }
      f.input :content, :input_html => { :disabled => true }
      f.input :supervisor_message, :input_html => { :disabled => true }
      f.input :total_days, :input_html => { :disabled => true }
      f.input :total_minutes, :input_html => { :disabled => true }
      f.input :leave_status, :as => :select , :collection =>['APPROVED','PENDING', 'RECOMMENDED', 'REJECT']
    end
    f.actions
  end


  end
