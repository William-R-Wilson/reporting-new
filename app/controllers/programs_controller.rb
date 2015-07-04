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

  def destroy
  end

  def index
    @programs = Program.all
  end
  
  private 
  
    def program_params
      params.require(:program).permit(:name)
    end
end
