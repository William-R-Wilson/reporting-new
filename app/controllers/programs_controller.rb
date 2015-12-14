class ProgramsController < ApplicationController
  before_action :check_if_admin, :authorize

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    respond_to do |format|
      if @program.save
        format.html { redirect_to programs_url, notice: 'Program was successfully added.' }
        format.json { redirect_to programs_url, status: :created, location: @programs }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to programs_url, notice: 'Program was successfully edited.' }
        format.json { redirect_to programs_url, status: :ok, location: @programs }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    respond_to do |format|
        format.html { redirect_to programs_url, notice: "Program was successfully deleted." }
        format.json { head :no_content }
    end
  end

  def index
    @programs = Program.all.order(:name)
  end

  private

    def program_params
      params.require(:program).permit(:name, :id)
    end
end
