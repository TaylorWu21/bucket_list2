class ListsController < ApplicationController
    before_action :list, except: [:index, :new, :create]
    before_action :bucket, except: [:index]

  def index	
  	@bucket = Bucket.find(params[:bucket_id]) 
  	@lists = @bucket.lists  
  end

  def show
  end

  def new
      @list = List.new
  end

  def create
      @list = @bucket.lists.new(list_params)
      if @list.save
          flash[:success] = "New item has been added to the list."
          redirect_to bucket_list_path(@bucket, @list)
      else
          render :new
      end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = "List has been updated!"
      redirect_to bucket_list_path(@bucket, @list)
    else
      render :edit
    end
  end

  def destroy
      @list.destroy
      flash[:success] = "List has been destroy"
      redirect_to bucket_lists_path
  end

  private
      def list_params
          params.require(:list).permit(:title, :description, :completed, :image)
      end

      def list
          @list = List.find(params[:id])
      end

      def bucket
          # @bucket = current_user.buckets.find(params[:bucket_id])
           @bucket = Bucket.find(params[:bucket_id])
      end
end