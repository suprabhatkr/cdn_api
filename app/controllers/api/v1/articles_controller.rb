require 'net/http'
require 'uri'
module Api
	module V1
		class ArticlesController < ApplicationController
			def index
				ans=''
				for k in params
					ans+=k.to_s
				end
				send_data(request.url)
			end
			def show
				#send_data(Rails.root)
				path=Rails.root.to_s+'/storage/'+params[:format]+'/'+params[:filename]+'.'+params[:format]
				if not File.exist?(path)
			        url = ('http://127.0.0.1/wordpress_blog/'+params[:filename]+'.'+params[:format])
			        page = Net::HTTP.get(URI.parse(url))
			        curr_path='storage'
			        new_path=params[:format]+'/'+params[:filename]
			        for folder in new_path.split('/').slice(0..-2)
			            curr_path+="/"+folder
			            if not File.exist?(curr_path)
			                Dir.mkdir(curr_path) 
			            end
			        end
			        f = File.new(curr_path+"/"+path.split('/')[-1],'w') 
			        f.puts(page)  
			        f.close()
			    end
			    send_file(path)
			end
		end
	end
end