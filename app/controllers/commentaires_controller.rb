class CommentairesController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	
    def create
	    @article = Article.find(params[:article_id])
	    @commentaire = @article.commentaires.create(comment_params)
	    redirect_to article_path(@article)
    end

    def destroy
		@article = Article.find(params[:article_id])
		@commentaire = @article.commentaires.find(params[:id])
		@commentaire.destroy
		redirect_to article_path(@article)
	end
 
    private
	    def comment_params
	        params.require(:commentaire).permit(:auteur, :corp)
	    end
end
