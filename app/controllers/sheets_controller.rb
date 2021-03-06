class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
  end

  def show
    @sheet = Sheet.find(params[:id])
  end

  def new
    @sheet = Sheet.new
  end

  def edit
    @sheet = Sheet.find(params[:id])
  end

  def create
    @sheet = Sheet.new(params[:sheet])
    if @sheet.save
      flash[:notice] = 'Success'
      redirect_to '/sheets'
    else
      flash[:error] = 'Errors in the form prevented it from being saved.  You\'ve probably done something horribly wrong.'
      render :new
    end
  end

  def update
    @sheet = Sheet.find(params[:id])
    if @sheet.update_attributes(params[:sheet])
      redirect_to @sheet, :notice => "SUCCESS'D"
    else
      render :action => "edit"
    end
  end

  def destroy
    @sheet = Sheet.find(params[:id])
    @sheet.destroy
  end

  def languages
		@languages = nil
		unless params[:search].nil?
			@languages = Sheet.languages params[:search]
		else 
			@languages = Sheet.languages
		end

 		respond_to do |format|
			format.html
			format.json { render :json => @languages }
		end
  end

  def language
    @sheets = Sheet.where :language => params[:search]
  end
end
