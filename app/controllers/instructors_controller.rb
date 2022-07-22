class InstructorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def index
    instructor = Instructor.all
    render json: instructor
  end

  def create
    instructor = Instructor.create!(instructor_params)
    render json: instructor, status: :created
  end

  def show
    instructor = find_instructor
    render json: instructor
  end

  def update
    instructor = find_instructor
    instructor.update!(instructor_params)
    render json: instructor
  end

  def destroy
    instructor = find_instructor
    instructor.destroy
    head :no_content
  end

  private

  def find_instructor
    Instructor.find(params[:id])
  end

  def instructor_params
    params.permit(:name)
  end

  def render_not_found_response
    render json: { message: "Record not found" }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: {
             message: "Missing required parameter"
           },
           status: :unprocessable_entity
  end
end
