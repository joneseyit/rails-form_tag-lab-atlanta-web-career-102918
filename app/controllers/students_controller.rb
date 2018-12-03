class StudentsController < ApplicationController
before_action :student_params, only: :show
  def index
    @students = Student.all
  end

  def show

    @student = Student.find(params[:id])
  end

  def new
  end

  def create

    @student = Student.new(student_params)

    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end

  end

  private
    def student_params
      # params.require(:article).permit(:title, :text)
      params.permit("first_name", "last_name")


    end

end
