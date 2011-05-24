module Lokka
  module CommentAutoApproved
    def self.registered(app)
      app.before do 
        path = request.env['PATH_INFO']
        if params["comment"] && /^\/admin\/comments/ !~ path
          params["comment"]["status"] = Comment::APPROVED
        end
      end
    end
  end
end
