class HomeController < ApplicationController
  def index
  	#  @buckets = Bucket.where(user_id: !current_user.id)
  	 @buckets = Bucket.all - current_user.buckets
	  if params[:search]
	     @buckets = Bucket.search(params[:search])
	  else
	    @buckets = Bucket.all - current_user.buckets
	  end
  end
end
