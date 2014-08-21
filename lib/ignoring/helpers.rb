require "fileutils"
require "octokit"
require "highline/import"
require "git"
require "terminal-table"

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
    # @param items the items/languages to add
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

    # Logic for listing the languages
    def list
      langs = Octokit.gitignore_templates
      lang_rows = []
      langs.each_slice(4) do |group|
        lang_rows << group
      end
      table = Terminal::Table.new(rows: lang_rows)
      table.style = {border_x: "", border_i: "", border_y: ""}
      puts table
    rescue
      puts "Error gitting language information. You might have reached your rate limit for the hour."
    end

    # logic for showing gitignores
    #
    # @param options the options hash
    def show(options)
      if options[:global]
        file = Git.global_config("core.excludesfile")
        puts File.read(file) if File.exists?(file)
      elsif options[:language]
        puts Octokit.gitignore_template(options[:language])[:source]
      else
        puts File.read('.gitignore') if File.exists?('.gitignore')
      end
    rescue
      puts "#{language} is not a valid language."
    end

    private

    # Helper method for parsing github language template
    def language_array(language)
      Octokit.gitignore_template(language)[:source].split("\n")
    rescue
      puts "#{language} is not a valid language."
    end
  end
end
