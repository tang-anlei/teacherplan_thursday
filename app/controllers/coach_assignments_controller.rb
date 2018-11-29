class CoachAssignmentsController < ApplicationController
  def index
    @coach_assignments = CoachAssignment.all

    render("coach_assignment_templates/index.html.erb")
  end

  def show
    @coach_assignment = CoachAssignment.find(params.fetch("id_to_display"))

    render("coach_assignment_templates/show.html.erb")
  end

  def new_form
    @coach_assignment = CoachAssignment.new

    render("coach_assignment_templates/new_form.html.erb")
  end

  def create_row
    @coach_assignment = CoachAssignment.new

    @coach_assignment.user_id = params.fetch("user_id")
    @coach_assignment.improvement_id = params.fetch("improvement_id")

    if @coach_assignment.valid?
      @coach_assignment.save

      redirect_back(:fallback_location => "/coach_assignments", :notice => "Coach assignment created successfully.")
    else
      render("coach_assignment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_improvement_plan
    @coach_assignment = CoachAssignment.new

    @coach_assignment.user_id = params.fetch("user_id")
    @coach_assignment.improvement_id = params.fetch("improvement_id")

    if @coach_assignment.valid?
      @coach_assignment.save

      redirect_to("/improvement_plans/#{@coach_assignment.improvement_id}", notice: "CoachAssignment created successfully.")
    else
      render("coach_assignment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @coach_assignment = CoachAssignment.find(params.fetch("prefill_with_id"))

    render("coach_assignment_templates/edit_form.html.erb")
  end

  def update_row
    @coach_assignment = CoachAssignment.find(params.fetch("id_to_modify"))

    @coach_assignment.user_id = params.fetch("user_id")
    @coach_assignment.improvement_id = params.fetch("improvement_id")

    if @coach_assignment.valid?
      @coach_assignment.save

      redirect_to("/coach_assignments/#{@coach_assignment.id}", :notice => "Coach assignment updated successfully.")
    else
      render("coach_assignment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @coach_assignment = CoachAssignment.find(params.fetch("id_to_remove"))

    @coach_assignment.destroy

    redirect_to("/users/#{@coach_assignment.user_id}", notice: "CoachAssignment deleted successfully.")
  end

  def destroy_row_from_improvement
    @coach_assignment = CoachAssignment.find(params.fetch("id_to_remove"))

    @coach_assignment.destroy

    redirect_to("/improvement_plans/#{@coach_assignment.improvement_id}", notice: "CoachAssignment deleted successfully.")
  end

  def destroy_row
    @coach_assignment = CoachAssignment.find(params.fetch("id_to_remove"))

    @coach_assignment.destroy

    redirect_to("/coach_assignments", :notice => "Coach assignment deleted successfully.")
  end
end
