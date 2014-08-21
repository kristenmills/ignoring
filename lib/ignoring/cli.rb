require "thor"

# CLI class
module Ignoring
  class CLI < Thor

    desc "create", "creates a new gitignore if one doesn't exist in the directory"
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    def create
      Helpers::create(options)
    end

    desc "add [ITEM/LANGUAGE...]", "Adds a new item to the gitignore if it isn't already added"
    option :global, type: :boolean, desc: "use global gitignore", aliases: :g
    option :languages, type: :boolean, desc: "get language templates from github", aliases: :l
    def add(*items)
      Helpers::add(options, items)
    end

    desc "list", "lists the different languages available from github/gitignore"
    def list
      Helpers::list
    end

    desc "show", "displays a gitignore"
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    option :language, desc: "displays gitignore for language from github/gitignore repo", aliases: :l
    def show
      # TODO
    end
  end
end
