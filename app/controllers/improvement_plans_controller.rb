class ImprovementPlansController < ApplicationController
  before_action :current_user_must_be_improvement_plan_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_improvement_plan_user
    improvement_plan = ImprovementPlan.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == improvement_plan.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = ImprovementPlan.ransack(params[:q])
    @improvement_plans = @q.result(:distinct => true).includes(:user, :goals, :coaches, :coachs).page(params[:page]).per(10)

    render("improvement_plan_templates/index.html.erb")
  end

  def show
    @coach_assignment = CoachAssignment.new
    @goal = Goal.new
    @improvement_plan = ImprovementPlan.find(params.fetch("id_to_display"))

    render("improvement_plan_templates/show.html.erb")
  end

  def new_form
    @improvement_plan = ImprovementPlan.new

    render("improvement_plan_templates/new_form.html.erb")
  end

  def create_row
    @improvement_plan = ImprovementPlan.new

    @improvement_plan.state = params.fetch("state")
    @improvement_plan.user_id = params.fetch("user_id")
    @improvement_plan.comments = params.fetch("comments")
    @improvement_plan.coach_id = params.fetch("coach_id")

    if @improvement_plan.valid?
      @improvement_plan.save

      redirect_back(:fallback_location => "/improvement_plans", :notice => "Improvement plan created successfully.")
    else
      render("improvement_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @improvement_plan = ImprovementPlan.find(params.fetch("prefill_with_id"))

    render("improvement_plan_templates/edit_form.html.erb")
  end

  def update_row
    @improvement_plan = ImprovementPlan.find(params.fetch("id_to_modify"))

    @improvement_plan.state = params.fetch("state")
    
    @improvement_plan.comments = params.fetch("comments")
    @improvement_plan.coach_id = params.fetch("coach_id")

    if @improvement_plan.valid?
      @improvement_plan.save

      redirect_to("/improvement_plans/#{@improvement_plan.id}", :notice => "Improvement plan updated successfully.")
    else
      render("improvement_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @improvement_plan = ImprovementPlan.find(params.fetch("id_to_remove"))

    @improvement_plan.destroy

    redirect_to("/improvement_plans", :notice => "Improvement plan deleted successfully.")
  end
end
