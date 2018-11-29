class ImprovementPlansController < ApplicationController
  def index
    @improvement_plans = ImprovementPlan.all

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
    @improvement_plan.user_id = params.fetch("user_id")
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
