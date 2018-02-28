class DiscussionsController < ApplicationController
  before_action :set_discussions, only: [:show, :edit, :update, :destroy]
  before_action :find_channels, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @discussions = Discussion.all.order('created_at desc')
  end

  def show
    @discussions = Discussion.all.order('created_at desc')
  end

  def new
    @discussion = current_user.discussions.build
  end

  def edit
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created' }
        format.json { render :show, status: :created, location: @discussion}
      else
        format.html {render :new }
        format.json {render json: @dicusssion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @dicussion, notice: 'Discussion was successfully updated.'}
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @dicsussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: 'Discussion was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def find_channels
    @channels = Channel.all.order('created_at desc')
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content, :channel_id)
  end
end
