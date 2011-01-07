class VocablesController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @new_vocable = @lesson.vocables.create(params[:vocable])
    
    respond_to do |format|
      if @new_vocable.save
        # format.json { render :json => @new_vocable }
        format.js
        format.html { redirect_to @lesson }
      else
        # format.json { render :json => @new_vocable.errors }
        format.js
        format.html do
          @title = @lesson.name
          render 'lessons/show'
        end
      end
    end
  end
  
  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
  end
end
