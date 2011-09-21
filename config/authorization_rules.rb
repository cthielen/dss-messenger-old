authorization do
  role :admin do
    has_permission_on [:messages, :templates, :applications], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:site], :to => [:index, :search, :logout]
  end
end
