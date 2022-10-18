class SpaceController < ApplicationController
  before_action :load

  def index
    @images = @space.images.filtered.limit(48)
    @questions = @space.questions.ordered
  end

  def generate_image
    @image = Image.new  space: @space,
                        user: @user,
                        prompt: ''
    params['question'].each do |key, value|
      question = Question.find key
      answer = Answer.create  space: @space,
                              user: @user,
                              question: question,
                              value: value
      @image.prompt += answer.prompt
      @image.answers << answer
    end
    @image.prompt += @space.prompt
    @image.save
    redirect_to show_image_path(@space.slug, @image.id)
  end

  def show_image
  end

  def like_image
    Like.toggle! @image, @user
    redirect_to show_image_path(@space.slug, @image.id)
  end

  def blame_image
    Blame.toggle! @image, @user
    redirect_to show_image_path(@space.slug, @image.id)
  end

  protected

  def load
    @space = Space.find_by slug: params[:space_slug]
    @user = User.with_cookies cookies, @space
    @image = @space.images.find params[:image_id] if params.has_key? :image_id
  end
end