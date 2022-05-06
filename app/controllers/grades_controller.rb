class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /grades
  def index
    if params[:sort] == "ascending"
      @grades = Grade.all.order("student_grade")
    elsif params[:sort] == "descending"
      @grades = Grade.all.order("student_grade").reverse
    else
      @grades = Grade.all
    end
  end

  # GET /grades/1
  def show
    if (current_user.nil?)
      redirect_to user_session_path, notice: "Insufficient access"
    end
  end

  # GET /grades/new
  def new
    if (current_user.nil?)
      redirect_to user_session_path, notice: 'Insufficient access.'
    else
      @grade = Grade.new
    end
  end

  # GET /grades/1/edit
  def edit
    if (current_user.nil?)
      redirect_to user_session_path, notice: "Insufficient access"
    end
  end

  # POST /grades
  def create
    if (current_user.nil?)
      redirect_to user_session_path, notice: "Insufficient access"
    else
      @grade = Grade.new(grade_params)

      if @grade.save
        redirect_to @grade, notice: 'Grade was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /grades/1
  def update
    if (current_user.nil?)
      redirect_to user_session_path, notice: "Insufficient access"
    else
      if @grade.update(grade_params)
        redirect_to @grade, notice: 'Grade was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /grades/1
  def destroy
    #if (current_user.account_id == 1)
      @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
    #end
=begin
    if (current_user.account_id == 1)
      @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
    else
      redirect_to user_session_path, notice: 'Insufficient access.'
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:student_id, :student_name, :student_grade)
    end
end
