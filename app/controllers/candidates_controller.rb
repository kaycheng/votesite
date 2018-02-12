class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:edit, :update, :destroy]

  def index
    @candidates = Candidate.all
    # @candidates is a instance valuable, let params send to view through by http helper. 
  end

  def new
    @candidate = Candidate.new
    # @candidate for view.
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to root_path, notice: "Great!"
    else
      render :new
      # If the data can't save, the page will return to new page.
      # So we use the same instance valuable let new page can still run.
      # render :new is mean "I'm still do the create action, but I use 
      # new page to show." 
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to root_path, notice: "Great job!"
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to root_path
  end


  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end
  # This is a strong parameters function, can clear user data to avoid bad program.
end