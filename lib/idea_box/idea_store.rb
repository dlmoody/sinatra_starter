require 'idea_box/idea'
require 'yaml/store'

class IdeaStore

  def self.all
      raw_ideas.collect do |data|
          Idea.new(data[:title], data[:description])
      end
  end

  def self.create(attributes)
    database.transaction do
      database['ideas'] ||= []
      database['ideas'] << attributes
    end
  end

  def self.delete(position)
      database.transaction do
        database['ideas'].delete_at(position)
      end
  end

  def self.find(position)
      raw_idea = find_raw_idea(position)
      Idea.new(raw_idea[:title], raw_idea[:description])
  end

  def self.update(id, data)
      database.transaction do
        database['ideas'][id] = data
      end
  end

  def self.find_raw_idea(position)
    database.transaction do |db|
      db['ideas'].at(position)
    end
  end



  def self.raw_ideas
      database.transaction do |db|
          db['ideas'] || []
      end
  end


  def self.database
      @database ||= YAML::Store.new "ideabox"
  end
end
