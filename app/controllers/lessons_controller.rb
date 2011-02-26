# coding: utf-8

class LessonsController < ApplicationController
  before_filter :login_required, :except => [:show]
  before_filter :is_owner, :except => [:show, :create]
  
  def show
    @lesson = Lesson.find(params[:id])
    @new_vocable ||= @lesson.vocables.build
  end
  
  def create
    @new_lesson = current_user.lessons.create(params[:lesson])
    if @new_lesson.save
      redirect_to user_lesson_path(current_user, @new_lesson)
    else
      index
      render :index
    end
  end
  
  def destroy
    lesson = Lesson.find(params[:id])
    if lesson.destroy
      redirect_to(lesson.user, :flash => { :notice => "Lesson “#{lesson.name}” was deleted." })
    else
      redirect_to user_lesson_path(lesson.user, lesson), :flash => { :error => "Lesson could not be deleted." }
    end
  end
  
  def test
    lesson = Lesson.find(params[:id])
    redirect_to ask_user_lesson_vocable_path(lesson.user, lesson, lesson.random_vocable)
  end

  private

  def is_owner
    unless Lesson.find(params[:id]).user == current_user
      redirect_to :back
    end
  end
end
