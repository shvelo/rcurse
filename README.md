# Rcurse [![Build Status](https://travis-ci.org/shvelo/rcurse.svg?branch=master)](https://travis-ci.org/shvelo/rcurse) [![Gem Version](https://badge.fury.io/rb/rcurse.svg)](http://badge.fury.io/rb/rcurse)


Rcurse is a super simple template engine written in Ruby.

## Installation

Install it with `gem install rcurse`, 

### Using Bundler

add `gem "rcurse"` to your `Gemfile` and run `bundle install`

## Usage

Require it with `require 'rcurse'`.  
Call `Rcurse::render "file.rcurse"` to render `file.rcurse` and return the rendered file contents, you can then write it to a file.

### Usage example

Let's assume that we have file names `index.rcurse` and want to render it to `index.html`

```ruby
require 'rcurse'
Rcurse::render_file("index.rcurse", "index.html")
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
