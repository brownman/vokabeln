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
    @vocable = Vocable.find(params[:id])
    @vocable.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to vocable.lesson }
    end
  end
  
  def ask
    @vocable = Vocable.find(params[:id])
  end
  
  def check
    @vocable = Vocable.find(params[:id])
    @success = @vocable.check_foreign(params[:vocable][:foreign])
  end
  
  #def next
  #  vocable = Vocable.find(params[:id])
  #  lesson = vocable.lesson
  #  redirect_to 
  #end
end
