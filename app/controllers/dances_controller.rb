class DancesController < ApplicationController
    def index
        @posts = Post.all
    end
end
