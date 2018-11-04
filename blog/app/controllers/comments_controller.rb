class CommentsController < ApplicationController
    def create
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:article_id])

        # 글에 새로운 코멘드 모델 만들기
        @comment = @article.comments.create(comment_params)

        # 코멘트가 작성된 글로 리디렉트
        redirect_to article_path(@article)
    end

    def destroy
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:article_id])

        # 글에서 아이디에 해당하는 댓글 찾기
        @comment = @article.comments.find(params[:id])

        # 데이터베이스에서 댓글 모델 삭제
        @comment.destroy

        # 코멘트가 작성된 글로 리디렉트
        redirect_to article_path(@article)
    end

      private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
