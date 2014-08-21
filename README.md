# Ignoring

Tool for managing and creating your `.gitignore`

## Installation

Add this line to your application's Gemfile:

    gem 'ignoring'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ignoring

## Usage

This tool is realtively simple to use.  You can use either `ignoring` or `gitignore`. For these examples, I will be using `gitignore`.

### Creating a gitignore

Creating a .gitignore file in your currrent directory

    $ gitignore create
    
Creating a global gitignore (You will be prompted for a location)

    $ gitignore create -g
    $ gitignore create --global
    
### Adding to a gitignore

Adding items to the gitignore

    $ gitignore add tmp Gemfile.lock
    $ gitignore add -g .DS_Store
    $ gitignore add --global .DS_Store
    
Adding languages to the gitignore. (These are retrieved from github's gitignores)

    $ gitignore add -l Ruby Rails
    $ gitignore add -g -l Ruby Rails
    $ gitignore add --global --languages Ruby Rails
    
### List languages

List languages from github's gitignores

    $ gitignore list
    
### Show gitignores

Print your local gitignore to STDOUT

    $ gitignore show

Print your global gitignore to STDOUT

    $ gitignore show -g
    $ gitignore show --global
    
Print a specific language to STDOUT

    $ gitignore show -l Ruby
    $ gitignore show --language Ruby
    
## Future

* Create your own templates


## Contributing

1. Fork it ( http://github.com/kristenmills/ignoring/fork )
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create new Pull Request
