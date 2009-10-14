# Collecta Ruby Library

## Overview

A quick and rough Ruby/Rails library to query info from the [Collecta][1] API. Check their [documentation][2] for more info.

[1]: http://collecta.com/
[2]: http://developer.collecta.com/

## Installation

### Ruby on Rails Plugin

    script/plugin install git://github.com/jimeh/collecta_ruby.git

### RubyGem

The gem is hosted on [Gemcutter][1]. If you don't have Gemcutter setup already, I recommend you do so by following the instructions on their [documentation][2] page.

[1]: http://gemcutter.org/
[2]: http://gemcutter.org/pages/gem_docs

Install with Gemcutter:

    sudo gem install collecta

If you would prefer to not get setup for Gemcutter, install with this command instead:

    sudo gem install collecta --source http://gemcutter.org/

## Setup

### Ruby on Rails Plugin

Edit `config/collecta.yml` to supply your Collecta API key(s) for the each environment.

### Ruby on Rails with RubyGem

Add the following to your `environment.rb`:

    config.gem "collecta", :source => "http://gemcutter.org/"

Then create a initializer called `collecta.rb` and specify your Collecta API key the same way as bellow for Plain Ruby.

### Plain Ruby

Supply your API key to the Collecta class:

    Collecta.api_key = "APIKEY"

## Usage

Search for iPhone:

    Collecta.search("iPhone")

Search with additional options/parameters:

    Collecta.search("iPhone", :format => "json", :page => 2, :category => ["technology", "games"], :exclude => ["politics"])

Available parameter options are `:rpp`, `:page`, `:since_id`, `:format`, `:callback`, `:category`, and `:exclude`. The `:exclude` parameter simply excludes results from specified categories.

## Notes / Warnings

* Response data from Collecta is currently returned in it's raw JSON or Atom form. Parsing the JSON responses to a Hash fails cause it's more than 20 levels deep. And parsing the Atom data fails for some reason cause XPath doesn't like Atom, and I'm no XML expert. If you know better than me, please fork, fix, and pull request :)

* If you have any suggestions, comments, or complaints, please don't hesitate to contact me.


## License

(The MIT License)

Copyright (c) 2009 Jim Myhrberg.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.