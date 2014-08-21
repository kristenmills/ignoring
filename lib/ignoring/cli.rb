require "thor"

# CLI class
module Ignoring
  class CLI < Thor

    desc "create", "creates a new gitignore if one doesn't exist in the directory"
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    def create
      # TODO
    end

    desc "add [ITEM...]", "Adds a new item to the gitignore if it isn't already added"
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    def add(*items)
      # TODO
    end

    desc "language [LANGUAGE...]", "Adds the gitignore from github/gitignore repo to the gitignore."
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    def language(*language)
      # TODO
    end

    desc "lang [LANGUAGE...]", "Adds the gitignore from github/gitignore repo to the gitignore."
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    alias_method :lang, :language

    desc "list", "lists the different languages available from github/gitignore"
    def list
      # TODO
    end

    desc "show", "displays a gitignore"
    option :global, type: :boolean, desc: "whether to use global gitignore", aliases: :g
    option :language, desc: "displays gitignore for language from github/gitignore repo", aliases: :l
    def show
      # TODO
    end
  end
end
