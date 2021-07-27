module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post

      def index
        #取得したレコードを特定のキーで並び替える
        #降順
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
      end
      
      def create
        post = Post.new(post_params)
        if post.save #セーブが成功した場合
          render json:{ status: 'SUCCESS', data: post}
        else
          render json:{ status: 'ERROR', data: post.errors }
        end
      end

      private
        # 許可するパラメータはprivateメソッドでカプセル化します。
        # これは非常によい手法であり、createとupdateの両方で使いまわすことで
        # 同じ許可を与えることができます。また、許可する属性をユーザーごとにチェックするよう
        # このメソッドを特殊化することもできます。
        def set_post
          @post = Post.find(params[:id])
        end

        def post_params
          params.require(:post).permit(:title)
        end
      end
  end
end
