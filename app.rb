

class IdeaBoxApp < Sinatra::Base
  get '/' do
      erb:Index
  end
end
