Rails.application.routes.draw do
  root "categories#index"  # หน้าแรกจะแสดง todos

  resources :categories do
    resources :todos  # อนุญาตให้มี todos ที่เชื่อมโยงกับแต่ละ category
  end

  resources :todos do
    patch :change_status, on: :member
  end
end
