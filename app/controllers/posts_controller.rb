class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        #部分検索
        @posts = Post.where("about LIKE ? ",'%' + params[:search] + '%')
      end
        
    end

    def new
        @post = Post.new
      end
    
      def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "index", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end
    
      def comparison
      end

      def result
        @posts_1_to_1000 = filter_posts(0, 1000)
      end

      def resultone
        @posts_1000_to_5000 = filter_posts(1000, 5000)
      end

      def resulttwo
        @posts_5000_to_10000 = filter_posts(5000, 10000)
      end

      def number
        @posts_1_to_10 = fil_posts(1, 10)
      end

      def numberone
        @posts_10_to_50 = fil_posts(10, 50)
      end

      def numbertwo
        @posts_50_to_100 = fil_posts(50, 0)
      end



      private
      def filter_posts(price_min, price_max)
        Post.where("price >= ? and price < ?", price_min, price_max)
      end

      def fil_posts(number_min, number_max)
        Post.where("number >= ? and number < ?", number_min, number_max)
      end

      def post_params
        params.require(:post).permit(:name, :address, :price, :about, :number, :area, :image, :overall)
      end

      
end
