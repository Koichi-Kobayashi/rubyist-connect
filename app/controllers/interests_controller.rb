class InterestsController < ApplicationController
  before_action :set_interest, only: [ :destroy, :edit, :update ]

  def index
    @interests = Interest.all
  end

  def new
    @interest = current_user.interests.build
  end

  def create
    @interest = current_user.interests.build(interest_params)
    respond_to do |format|
      if @interest.save
        format.html { redirect_to interests_path, notice: 'Tag was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to interests_path, notice: 'Tag was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @interest.destroy
    respond_to do |format|
      format.html { redirect_to interests_path , notice: 'Tag was successfully destroyed.' }
    end
  end

  private

    def set_interest
      @interest = current_user.interests.find(params[:id])
    end

    def interest_params
      params.require(:interest).permit( :content, :content_url)
    end
end
