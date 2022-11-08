class ImagesController < ApplicationController
  before_action :load

  def index
    @images = current_space.images.filtered.page(params[:page]).per(96)
  end

  def new
    @images = current_space.images.filtered.limit(48)
    @questions = current_space.questions.active.ordered
    @image = Image.new
  end

  def create
    @image = Image.new  space: current_space,
                        user: current_user,
                        prompt: ''
    params['question'].each do |key, value|
      question = Question.find key
      answer = Answer.create  space: current_space,
                              user: current_user,
                              question: question,
                              value: value
      @image.prompt += answer.prompt
      @image.answers << answer
    end
    @image.prompt += current_space.prompt
    @image.save
    redirect_to image_path(@image)
  end

  def show
    if @image.ready?
      @ask_for_pseudo = current_user.pseudo.blank? && @image.user == current_user
      @ask_for_email = current_user.email.blank?
    else
      render :pending
    end
  end

  def like
    Like.toggle! @image, current_user
    redirect_to image_path(@image)
  end

  def blame
    Blame.toggle! @image, current_user
    redirect_to image_path(@image)
  end

  protected

  def load
    @image = current_space.images.find params[:id] if params.has_key? :id
  end
end