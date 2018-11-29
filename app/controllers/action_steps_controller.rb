class ActionStepsController < ApplicationController
  def index
    @q = ActionStep.ransack(params[:q])
    @action_steps = @q.result(:distinct => true).includes(:goal).page(params[:page]).per(10)

    render("action_step_templates/index.html.erb")
  end

  def show
    @action_step = ActionStep.find(params.fetch("id_to_display"))

    render("action_step_templates/show.html.erb")
  end

  def new_form
    @action_step = ActionStep.new

    render("action_step_templates/new_form.html.erb")
  end

  def create_row
    @action_step = ActionStep.new

    @action_step.description = params.fetch("description")
    @action_step.target_date = params.fetch("target_date")
    @action_step.resources_needed = params.fetch("resources_needed")
    @action_step.implementation_specifics = params.fetch("implementation_specifics")
    @action_step.measures_of_success = params.fetch("measures_of_success")
    @action_step.lead = params.fetch("lead")
    @action_step.goal_id = params.fetch("goal_id")

    if @action_step.valid?
      @action_step.save

      redirect_back(:fallback_location => "/action_steps", :notice => "Action step created successfully.")
    else
      render("action_step_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_goal
    @action_step = ActionStep.new

    @action_step.description = params.fetch("description")
    @action_step.target_date = params.fetch("target_date")
    @action_step.resources_needed = params.fetch("resources_needed")
    @action_step.implementation_specifics = params.fetch("implementation_specifics")
    @action_step.measures_of_success = params.fetch("measures_of_success")
    @action_step.lead = params.fetch("lead")
    @action_step.goal_id = params.fetch("goal_id")

    if @action_step.valid?
      @action_step.save

      redirect_to("/goals/#{@action_step.goal_id}", notice: "ActionStep created successfully.")
    else
      render("action_step_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @action_step = ActionStep.find(params.fetch("prefill_with_id"))

    render("action_step_templates/edit_form.html.erb")
  end

  def update_row
    @action_step = ActionStep.find(params.fetch("id_to_modify"))

    @action_step.description = params.fetch("description")
    @action_step.target_date = params.fetch("target_date")
    @action_step.resources_needed = params.fetch("resources_needed")
    @action_step.implementation_specifics = params.fetch("implementation_specifics")
    @action_step.measures_of_success = params.fetch("measures_of_success")
    @action_step.lead = params.fetch("lead")
    @action_step.goal_id = params.fetch("goal_id")

    if @action_step.valid?
      @action_step.save

      redirect_to("/action_steps/#{@action_step.id}", :notice => "Action step updated successfully.")
    else
      render("action_step_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_goal
    @action_step = ActionStep.find(params.fetch("id_to_remove"))

    @action_step.destroy

    redirect_to("/goals/#{@action_step.goal_id}", notice: "ActionStep deleted successfully.")
  end

  def destroy_row
    @action_step = ActionStep.find(params.fetch("id_to_remove"))

    @action_step.destroy

    redirect_to("/action_steps", :notice => "Action step deleted successfully.")
  end
end
