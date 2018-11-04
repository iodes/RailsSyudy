class ArticlesController < ApplicationController
    def new
        # 빈 모델 생성
        @article = Article.new
    end

    def show
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:id])
    end

    def edit
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:id])
    end

    def index
        # 데이터베이스에서 글 모든 모델 읽기
        @articles = Article.all
    end

    def create
        # 새로운 글 모델 생성
        @article = Article.new(article_params)

        # 데이터베이스에 모델 저장
        if @article.save
            # 작성한 모델로 리디렉트
            redirect_to @article
        else
            # 모델 검증 실패
            render 'new'
        end
    end

    def update
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:id])

        # 데이터베이스에 모델 갱신
        if @article.update(article_params)
            # 갱신한 모델로 리디렉트
            redirect_to @article
        else
            # 모델 검증 실패
            render 'edit'
        end 
    end

    def destroy
        # 아이디에 해당하는 글 모델 찾기
        @article = Article.find(params[:id])

        # 데이터베이스에서 모델 삭제
        @article.destroy

        # 글 목록으로 리디렉트
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
