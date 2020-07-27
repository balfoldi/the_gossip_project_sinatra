class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all, comments: Comment.all}
	end
	get'/gossips/new/' do
    	erb :new_gossip
  	end
	get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.find(params['id']), gossip_id: (params['id'])}
	end
	get '/gossips/edit/:id' do
		erb :edit, locals: {id: params['id']}
	end
	post '/gossips/new/' do
		puts params["gossip_author"]
		Gossip.new(params["gossip_author"],params["gossip_content"]).save
		redirect '/'
	end
	post '/gossips/edit/:id' do
		Gossip.edit(params["gossip_author"],params["gossip_content"], params["id"])
		redirect '/'
	end
	post '/comment/:id' do
		Comment.new(params['id'], params["comment_content"]).save
	redirect '/'
	end
  run! if app_file == $0
end