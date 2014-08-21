require "thor"

# CLI class
module Ignoring
  class CLI < Thor

    desc "create", "creates a new gitignore if one doesn't exist in the directory"
    def create
    end

    desc "add [ITEM...]", "Adds a new item to the gitignore if it isn't already added"
    def add(*items)
    end

    desc "language [LANGUAGE...]", "Adds the gitignore from github/gitignore repo to the gitignore."
    def language(*language)
    end

    desc "lang [LANGUAGE...]", "Adds the gitignore from github/gitignore repo to the gitignore."
    alias_method :lang, :language

    desc "list", "lists the different languages available from github/gitignore"
    def list
    end

    desc "show", "displays a gitignore"
    option :global, type: :boolean, desc: "prints out global gitignore", aliases: :g
    option :language, desc: "displays gitignore for language from github/gitignore repo", aliases: :l
    def show
    end
  end
end
