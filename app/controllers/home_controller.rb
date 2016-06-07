class HomeController < ApplicationController
  def index
  	#  @buckets = Bucket.where(user_id: !current_user.id)
  	
	  if params[:search]
	     @buckets = Bucket.search(params[:search]).paginate(:page => params[:page], :per_page => 6)
	  else
	    @buckets = Bucket.where.not(user_id: current_user.id).paginate(:page => params[:page], :per_page => 6)
	  end
  end
end
