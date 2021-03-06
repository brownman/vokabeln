class VocablesController < ApplicationController
  before_filter :is_owner, :except => [:create, :search]
  
  def create
    redirect_to :back unless User.find(params[:user_id]) == current_user
    
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
    vocable = Vocable.find(params[:id])
    success = vocable.check_foreign(params[:vocable][:foreign])
    if success
      flash[:success] = ["Fine", "Well done"].sample
    else
      flash[:error] = "Nope, the expression is #{vocable.foreign}"
    end
    redirect_to ask_user_lesson_vocable_path(vocable.lesson.user, vocable.lesson, vocable.lesson.random_vocable)
  end
  
  def search
    query = params[:q]
    unless query.empty?
      @vocables = Vocable.search(query)
      
      respond_to do |format|
        format.js { render 'search.html', :layout => 'insert_content' }
        format.html
      end
    else
      redirect_to root_path
    end
  end

  private

  def is_owner
    unless Vocable.find(params[:id]).lesson.user == current_user
      redirect_to :back
    end
  end
end
