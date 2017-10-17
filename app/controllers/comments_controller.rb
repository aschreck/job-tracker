class CommentsController < ApplicationController
	def new
		@job = Job.find(params[:jobs_id])
		@company = @job.company
		@comment = Comment.new
	end 

	def create
		@job = Job.find(params[:job_id])
		@company = @job.company
		@comment = @job.comments.new(comment_params)
		if @comment.save
			flash[:success] = "comment added!"
			redirect_to company_job_path(@company, @job)
		else 
			render :new
		end 
	end 

	private

	def comment_params
		params.require(:comment).permit(:body,:job_id)
	end 
end
