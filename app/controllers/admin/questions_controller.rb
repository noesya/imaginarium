class Admin::QuestionsController < Admin::ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def index
    @questions = Question.all
    breadcrumb
  end
  
  def show
    breadcrumb
  end
  
  def new
    @question = Question.new
    breadcrumb
  end
  
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to [:admin, @question], notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: "Question was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_url, notice: "Question was successfully destroyed."
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Questions', admin_questions_path    
    if @question
      @question.persisted?  ? add_breadcrumb(@question, [:admin, @question])
                            : add_breadcrumb('Nouvelle question')
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:space_id, :text, :additional_prompt, :position)
  end
end
