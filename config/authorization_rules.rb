authorization do
  role :admian do
    has_permission_on [:site, :messages, :templates], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
