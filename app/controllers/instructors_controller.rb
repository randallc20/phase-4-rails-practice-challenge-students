class InstructorsController < ApplicationController
  def index
    instructor = Instructor.all
    render json: instructor
  end

  def create
    instructor = Instructor.create(instructor_params)
    render json: instructor, status: :created
  end

  def show
    instructor = Instructor.find_by(id: params[:id])
    render json: instructor
  end

  def update
    instructor = Instructor.find_by(id: params[:id])
    instructor.update(instructor_params)
    render json: instructor
  end

  def destroy
    instructor = Instructor.find_by(id: params[:id])
    instructor.destroy
    head :no_content
  end

  private

  def instructor_params
    params.permit(:name)
  end
end
