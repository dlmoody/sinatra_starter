
require 'idea_box'


class IdeaBoxApp < Sinatra::Base
    set :method_override, true
    set :root, 'lib/app'

    configure :development do
        register Sinatra::Reloader
    end
    #handles the 404 errors
    not_found do
        erb :error
    end

    get '/' do
        erb :index, locals: { ideas: IdeaStore.all }
    end

    post '/' do

      idea = { :title => params['title'], :description => params['description'] }
      puts idea
      IdeaStore.create(idea)
      redirect '/'

    end

    delete '/:id' do |id|
        IdeaStore.delete(id.to_i)
        redirect '/'
    end

    get '/:id/edit' do |id|
      idea = IdeaStore.find(id.to_i)
      erb :edit, locals: { id: id, idea: idea}
    end

    put '/:id' do |id|
      data = {
        :title => params['title'],
        :description => params['description']
      }
      IdeaStore.update(id.to_i, data)
      redirect '/'

    end



end
