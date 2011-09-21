authorization do
  role :admin do
    has_permission_on [:site, :messages, :templates, :applications], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
