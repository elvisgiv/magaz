ActiveAdmin.register Order do

  controller do
     def permitted_params
      #params.permit :name, :weight, :price, :popular, warehouse_attributes: [:id, :quantity, :_destroy]#разрешает для изменения конкретные поля
      params.permit!#разрешает менять все поля во всех моделях
    end
      
    def scoped_collection
      Order.includes(:shipping_method, :order_status, :order_payment_status)
    end
  end

  member_action :set_paid, :method => :put do #это для кнопки Pay
    order = Order.find(params[:id])
    order.set_paid!
    redirect_to({:action => :edit}, {notice: "Approved!"})
  end

  action_item :only => :edit do #это кнопкa Pay
    link_to('Pay', set_paid_admin_order_path(order), :method => :put) if order.order_payment_status.name == 'unpaid'
  end


        
  index do 
    selectable_column
    column :id
    column :name
    column :phone
    column :email
    column :order_number
    column :shipping_method
    column :order_status
    column :order_payment_status
    column :order_date
    column :completed
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
