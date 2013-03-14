class CoursesController < ApplicationController

	before_filter :current_user, only: [:create, :edit,:update,:delete]


	def index
		@countCoursesPerPage = 5
		@courses = Course.where(ispublished: 1).paginate(page: params[:page], per_page: 5)
		@topics = Topic.order(:name)
	end


	def new
		@course = Course.new
	end


	def create
		@course = current_user.courses.build(params[:course])
		@course.user_id = current_user.id
		if @course.save
			flash[:success] = "Course added successfully!!!!"
			redirect_to @course
		else
			render 'new'
		end
	end
	

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update_attributes(params[:course])
			redirect_to @course, notice: "Successfully updated topic."
		else
			render :edit
		end
	end

	def show
		@course = Course.find(params[:id])

		@countCommentsPerPage = 5
		@comments = @course.comments.paginate(page: params[:page], per_page: 5)
		@count = @course.comments.count
		if signed_in? 
			unless RatingCache.find_by_cacheable_id(@course.id) == nil
				@qty = RatingCache.find_by_cacheable_id(@course.id).qty
			end
			
			@rated = Rate.find_by_rater_id(current_user.id)
		end
		# Just to redirect, needed due to button click event
		# @courses = Course.paginate(page: params[:page], per_page: 3)
		# @topics = Topic.all
		#@courses = Course.all
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		flash[:success] = "Successfully destroyed course."
		redirect_to courses_url
	end
end
