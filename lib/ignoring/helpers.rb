require "fileutils"
require "octokit"
require "highline/import"
require "git"

module Ignoring
  module Helpers
    extend self

    # Logic for creating a gitignore
    #
    # @param options the options hash
    def create(options)
      if options[:global]
        file = Git.global_config("core.excludesfile")
        if file.empty?
          file = ask("Where would you like your global gitignore? ")
          Git.global_config("core.excludesfile", file)
        end
      else
        file = '.gitignore'
      end
      FileUtils.touch(file)
    end

    # Logic for adding an item to a gitignore
    #
    # @param options the options hash
    # @param items the items to add
    def add(options, items)
      if options[:global]
        file = Git.global_config("core.excludesfile")
      else
        file = ".gitignore" if File.exist?(".gitignore")
      end
      if file.empty? or file.nil?
        puts "No gitignore. run create first." if file.empty?
      else
        combined = File.open(file).read.split("\n")
        if options[:languages]
          languages = items
          items = []
          languages.each do |lang|
            items += language_array(lang) || []
          end
        end
        items.each { |item| combined << item if !combined.include? item or item.start_with? "#" or item.empty? }
        File.open(file, "w") do |file|
          combined.each do |item|
            file.puts item
          end
        end
      end
    end

    def language_array(language)
      Octokit.gitignore_template(language)[:source].split("\n")
    rescue
      puts "#{language} is not a valid language."
    end
  end
end
