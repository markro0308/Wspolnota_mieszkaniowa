class Resolutions::CommentsController < CommentsController
    before_action :set_commentable

    private

        def set_commentable
            @commentable=Resolution.find(params[:resolution_id])
        end

end