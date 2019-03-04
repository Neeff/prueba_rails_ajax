ActiveAdmin.register Claim do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :claim, :user_id, :company_id 

  form do |f|
        inputs 'Add Claim' do
        f.input :user_id,
        label: 'User',
        as: :select,
        collection: User.pluck(:email, :id)
        f.input :company_id,
        label: 'Company',
        as: :select,
        collection: Company.pluck(:name,:id)
        f.input :claim
        end
        actions
       end
end
