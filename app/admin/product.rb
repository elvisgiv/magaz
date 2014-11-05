ActiveAdmin.register Product do

#permit_params :name, :weight, :price, :popular, :warehouse => [:quantity]
  controller do
    
    def permitted_params
      #params.permit :name, :weight, :price, :popular, warehouse_attributes: [:id, :quantity, :_destroy]#разрешает для изменения конкретные поля
      params.permit!#разрешает менять все поля во всех моделях
    end

    def scoped_collection
      Product.includes(:warehouse)
    end
  end
 
  index do
    column :id
    column :name
    column :weight
    column :price
    column :popular
    column "quantity", :warehouse_count
    actions
  end

  form do |f|
    f.inputs "Product Update" do
      f.input :name
      f.input :weight
      f.input :price
      f.input :popular
        #f.inputs :name => "Warehouse", :for => [f.object.warehouse || Warehouse.new] do |w|
        #f.inputs :name => "Warehouse", :for => [f.object.warehouse, :warehouse_attributes ] do |w|
        f.inputs :name => "Warehouse", :for => [:warehouse, f.object.warehouse || Warehouse.new] do |w|
          w.input :quantity
        end
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
