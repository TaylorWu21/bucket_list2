class BucketsController < ApplicationController

  before_action :bucket, except: [:index, :new, :create]

  def index
  	@buckets = current_user.buckets
  end

  def show
    commontator_thread_show(@bucket)
  end

  def new
  	@bucket = Bucket.new
  end

  def create
  	@bucket = Bucket.new(bucket_params)
  	if @bucket.save
  		flash[:success] = "Bucket List Created."
  		redirect_to buckets_path
  	else
  		flash[:notice] = "Failed to create"
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @bucket.update(bucket_params)
  		flash[:success] = "Update completed"
  		redirect_to bucket_path
  	else
  		flash[:notice] = "Failed to update bucket list."
  		render :edit
  	end
  end

  def destroy
  	@bucket.destroy
  	redirect_to buckets_path
  end

  def upvote 
    @bucket.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @bucket.downvote_by current_user
    redirect_to :back
  end

  private

  	def bucket_params
  		params.require(:bucket).permit(:title, :description, :completed, :user_id, :image)

  	end

  	def bucket
  		@bucket = Bucket.find(params[:id])
  	end
end
