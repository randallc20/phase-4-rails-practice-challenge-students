class StudentsController < ApplicationController
  def index
    student = Student.all
    render json: student
  end

  def create
    student = Student.create(student_params)
    render json: student, status: :created
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

  def update
    student = Student.find_by(id: params[:id])
    student.update(student_params)
    render json: student
  end

  def destroy
    student = Student.find_by(id: params[:id])
    student.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name)
  end
end
