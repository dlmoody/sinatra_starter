require './idea'
require 'yaml/store'

class IdeaBoxApp < Sinatra::Base
    set :method_override, true

    configure :development do
        register Sinatra::Reloader
    end
    #handles the 404 errors
    not_found do
        erb :error
    end

    get '/' do
        erb :index, locals: { ideas: Idea.all }
    end

    post '/' do
        idea = Idea.new( params['title'], params['description'] )
        idea.save
        redirect '/'
        # params.inspect
    end

    delete '/:id' do |id|
        Idea.delete(id.to_i)
        redirect '/'
    end

    get '/:id/edit' do |id|
      idea = Idea.find(id.to_i)
      erb :edit, locals: { id: id, idea: idea}
    end

    put '/:id' do |id|
      data = {
        :title => params['title'],
        :description => params['description']
      }
      Idea.update(id.to_i, data)
      redirect '/'

    end



end
