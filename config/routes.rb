Rails.application.routes.draw do
  get("/", {:controller => "calculations", :action => "flex_square"})
  get("/flexible/square/:a_number", { :controller => "calculations", :action =>"flex_square" })
  get("/flexible/square_root/:a_number", { :controller => "calculations", :action => "flex_square_root"})
  get("/flexible/payment/:a_number/:b_number/:c_number", { :controller => "calculations", :action =>"flex_payment"})
  
  get("/square/new", { :controller => "calculations", :action => "square_form"})
  get("/square/results", { :controller => "calculations", :action => "process_square"})
  
  get("/payment/new", { :controller => "calculations", :action => "payment_form"})
  get("/payment/results", { :controller => "calculations", :action => "process_payment"})
  
  get("/random/new", { :controller => "calculations", :action => "random_form"})
  get("/random/results", { :controller => "calculations", :action => "random_number_results"})
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
