module Lokka
  module FacebookLikeButton
    def self.registered(app)
      app.get '/admin/plugins/facebook_like_button' do
        haml :"plugin/lokka-facebook_like_button/views/index", :layout => :"admin/layout"
      end

      app.put '/admin/plugins/facebook_like_button' do
        Option.facebook_like_button_verb = params['facebook_like_button_verb']
        flash[:notice] = 'Updated'
        redirect '/admin/plugins/facebook_like_button'
      end
    end
  end

  module Helpers
    def facebook_like_button(url = nil)
      verb = Option.facebook_like_button_verb || 'like'
      url = "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}#{env['PATH_INFO']}" if url.blank?
      %Q(<iframe src="http://www.facebook.com/plugins/like.php?href=#{CGI.escape(url)}&amp;send=true&amp;layout=button_count&amp;width=450&amp;show_faces=false&amp;action=#{verb}&amp;colorscheme=light&amp;font&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:21px;" allowTransparency="true"></iframe>)
    end
  end
end
