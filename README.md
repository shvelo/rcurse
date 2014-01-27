# Rcurse <small>- Super simple template engine</small>

## Installation

Install it with `gem install rcurse`, 

### Using Bundler

add `gem :rcurse` to your `Gemfile` and run `bundle install`

## Usage

Require it with `require 'rcurse'`.  
Call `Rcurse.render "file.rcurse"` to render `file.rcurse` and return the rendered file contents, you can then write it to a file.

### Complete example

Let's assume that we have file names `index.rcurse` and want to render it to `index.html`

```ruby
require 'rcurse'
File.open("index.html", "w+") do |file|
	file.write(Rcurse.render("index.rcurse"))
end
```

## Helpers

Helpers are the only functionality Rcurse provides yet. Use them by inserting `{{helper-name arguments}}` in source files.   

### Builtin helpers
- `include filename` - include another file, like so: `{{include header.rcurse}}`

### Adding a helper

Use `Rcurse::Helper.new(name) { block }` to create a helper, your block can accept a single array of arguments.  
Use `Rcurse.add_helper(helper)` to add your helper to Rcurse. 

```ruby
my_helper = Rcurse::Helper.new("my_helper") do |arguments|
	# do something with arguments and return a string containing the new content
end
Rcurse.add_helper(my_helper)
```