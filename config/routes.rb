Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "improvement_plans#index"
  # Routes for the Coach assignment resource:

  # CREATE
  get("/coach_assignments/new", { :controller => "coach_assignments", :action => "new_form" })
  post("/create_coach_assignment", { :controller => "coach_assignments", :action => "create_row" })
  post("/create_coach_assignment_from_improvement_plan", { :controller => "coach_assignments", :action => "create_row_from_improvement_plan" })

  # READ
  get("/coach_assignments", { :controller => "coach_assignments", :action => "index" })
  get("/coach_assignments/:id_to_display", { :controller => "coach_assignments", :action => "show" })

  # UPDATE
  get("/coach_assignments/:prefill_with_id/edit", { :controller => "coach_assignments", :action => "edit_form" })
  post("/update_coach_assignment/:id_to_modify", { :controller => "coach_assignments", :action => "update_row" })

  # DELETE
  get("/delete_coach_assignment/:id_to_remove", { :controller => "coach_assignments", :action => "destroy_row" })
  get("/delete_coach_assignment_from_improvement/:id_to_remove", { :controller => "coach_assignments", :action => "destroy_row_from_improvement" })
  get("/delete_coach_assignment_from_user/:id_to_remove", { :controller => "coach_assignments", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Action step resource:

  # CREATE
  get("/action_steps/new", { :controller => "action_steps", :action => "new_form" })
  post("/create_action_step", { :controller => "action_steps", :action => "create_row" })
  post("/create_action_step_from_goal", { :controller => "action_steps", :action => "create_row_from_goal" })

  # READ
  get("/action_steps", { :controller => "action_steps", :action => "index" })
  get("/action_steps/:id_to_display", { :controller => "action_steps", :action => "show" })

  # UPDATE
  get("/action_steps/:prefill_with_id/edit", { :controller => "action_steps", :action => "edit_form" })
  post("/update_action_step/:id_to_modify", { :controller => "action_steps", :action => "update_row" })

  # DELETE
  get("/delete_action_step/:id_to_remove", { :controller => "action_steps", :action => "destroy_row" })
  get("/delete_action_step_from_goal/:id_to_remove", { :controller => "action_steps", :action => "destroy_row_from_goal" })

  #------------------------------

  # Routes for the Goal resource:

  # CREATE
  get("/goals/new", { :controller => "goals", :action => "new_form" })
  post("/create_goal", { :controller => "goals", :action => "create_row" })
  post("/create_goal_from_improvement_plan", { :controller => "goals", :action => "create_row_from_improvement_plan" })

  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:id_to_display", { :controller => "goals", :action => "show" })

  # UPDATE
  get("/goals/:prefill_with_id/edit", { :controller => "goals", :action => "edit_form" })
  post("/update_goal/:id_to_modify", { :controller => "goals", :action => "update_row" })

  # DELETE
  get("/delete_goal/:id_to_remove", { :controller => "goals", :action => "destroy_row" })
  get("/delete_goal_from_improvement_plan/:id_to_remove", { :controller => "goals", :action => "destroy_row_from_improvement_plan" })

  #------------------------------

  # Routes for the Improvement plan resource:

  # CREATE
  get("/improvement_plans/new", { :controller => "improvement_plans", :action => "new_form" })
  post("/create_improvement_plan", { :controller => "improvement_plans", :action => "create_row" })

  # READ
  get("/improvement_plans", { :controller => "improvement_plans", :action => "index" })
  get("/improvement_plans/:id_to_display", { :controller => "improvement_plans", :action => "show" })

  # UPDATE
  get("/improvement_plans/:prefill_with_id/edit", { :controller => "improvement_plans", :action => "edit_form" })
  post("/update_improvement_plan/:id_to_modify", { :controller => "improvement_plans", :action => "update_row" })

  # DELETE
  get("/delete_improvement_plan/:id_to_remove", { :controller => "improvement_plans", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
