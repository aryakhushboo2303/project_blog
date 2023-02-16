class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        #overrided create method using new and save
        @comment = @article.comments.new(comment_params)
        if @comment.save
        redirect_to article_path(@article)
        end
      end
      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      end
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :status)
        end
end
