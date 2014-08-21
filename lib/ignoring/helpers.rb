require 'fileutils'
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
        items.each { |item| combined << item unless combined.include? item }
        File.open(file, "w") do |file|
          combined.each do |item|
            file.puts item
          end
        end
      end
    end
  end
end
