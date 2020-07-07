class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path
	end

	def index
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

private
def post_params
	params.require(:post).permit(:food_name, :image, :caption,)
end

end