
class IdeaBoxApp < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
    #handles the 404 errors
    not_found do
        erb :error
    end
    
    get '/' do
        erb:Index
    end
    #post '/' do
    #    "creating an idea!"
    #end
end
