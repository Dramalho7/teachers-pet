Rails.application.routes.draw do
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "teachers#index"
resources :teachers, 
resources :students
resources :courses
resources :behavior_reports
resources :participation_reports
resources :grades
resources :parents
resources :attendances

end
