# Rcurse [![Build Status](https://travis-ci.org/shvelo/rcurse.svg?branch=master)](https://travis-ci.org/shvelo/rcurse) [![Gem Version](https://badge.fury.io/rb/rcurse.svg)](http://badge.fury.io/rb/rcurse) [![Code Climate](https://codeclimate.com/github/shvelo/rcurse.png)](https://codeclimate.com/github/shvelo/rcurse)


Rcurse is a super simple template engine written in Ruby.

## Installation

Install it with `gem install rcurse`, 

### Using Bundler

add `gem "rcurse"` to your `Gemfile` and run `bundle install`

## Usage

Require it with `require 'rcurse'`.  
Call `Rcurse::render_file("file.rcurse", "file.html")` to render `file.rcurse` to `file.html`.  
You can also render a template from a string: `Rcurse::render("rcurse template")`.

### Command-line usage

You can use Rcurse from command line: `rcurse <input file> <output file>`  
For example: 

```shell
rcurse index.rcurse index.html
```

## Evaluating code

Wrap your Ruby code in `{%` and `%}` to evaluate it. You can use it to set variables or do other stuff. This doesn't output anything to the template, if you want to output the result of your code, use `{%=` instead of `{%`, like `{%= "trololo".upcase %}`.

### Examples

Using variables:  

```html
{% name = "Hodor" %}

<h1>Hello, {%= name %}!</h1>
```

Renders as:

```html
<h1>Hello, Hodor!</h1>
```

## Context

Context contains a binding for template variables, and a path of current template if Rcurse is rendering a file.  
Use `context.eval` to evaluate Ruby code.

`context.eval "a = 1"`

See `context.path` for the path of currently rendered template.

## Helpers

Helpers are like functions you can call in your templates. Use them by inserting `{{helper-name arguments}}` in source files.   

### Builtin helpers
- `include filename` - include another file, like so: `{{include header.rcurse}}`

### Adding a helper

Use `Rcurse::Helper.new(name) { |args, context| do_something }` to create a helper, your block can accept a single array of arguments and a context.  

```ruby
my_helper = Rcurse::Helper.new("my_helper") do |arguments, context|
	# do something with arguments and return a string containing the new content
end
```
