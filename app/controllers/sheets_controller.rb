class SheetsController < ApplicationController
  # GET /sheets
  # GET /sheets.xml
  def index
    @sheets = Sheet.all
  end

  # GET /sheets/1
  # GET /sheets/1.xml
  def show
    @sheet = Sheet.find(params[:id])
  end

  # GET /sheets/new
  # GET /sheets/new.xml
  def new
    @sheet = Sheet.new
  end

  # GET /sheets/1/edit
  def edit
    @sheet = Sheet.find(params[:id])
  end

  # POST /sheets
  # POST /sheets.xml
  def create
    @sheet = Sheet.new(params[:sheet])
  end

  # PUT /sheets/1
  # PUT /sheets/1.xml
  def update
    @sheet = Sheet.find(params[:id])
    if @sheet.update_attributes(params[:sheet])
      redirect_to @sheet, :notice => "SUCCESS'D"
    else
      render :action => "edit"
    end
  end

  # DELETE /sheets/1
  # DELETE /sheets/1.xml
  def destroy
    @sheet = Sheet.find(params[:id])
    @sheet.destroy
  end
end
