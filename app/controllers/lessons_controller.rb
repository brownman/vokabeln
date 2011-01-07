class LessonsController < ApplicationController
  def index
    @title = "Lessons"
    @new_lesson ||= Lesson.new
    @lessons = Lesson.all
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    @title = @lesson.name
    @new_vocable ||= @lesson.vocables.build
  end
  
  def create
    @new_lesson = Lesson.new(params[:lesson])
    if @new_lesson.save
      redirect_to lesson_path(@new_lesson)
    else
      index
      render :index
    end
  end
  
  def destroy
    lesson = Lesson.find(params[:id])
    if lesson.destroy
      flash[:notice] = "Lesson &#8220;#{CGI.escapeHTML lesson.name}&#8221; was deleted."
      redirect_to :action => 'index'
    else
      flash[:error] = "Lesson could not be deleted."
      redirect_to lesson_path(lesson)
    end
  end
end
