# Collecta Ruby Library

## Overview

Quick and unfinished Ruby library to query info from the [Collecta][1] API. Check their [documentation][2] for more info.

[1]: http://collecta.com/
[2]: http://developer.collecta.com/

## Usage

Set your Collecta API Key:

    Collecta.set_key = "APIKEY"

Search for iPhone:

    Collecta.search("iPhone")

Search with additional options/parameters:

    Collecta.search("iPhone", :format => "json", :page => 2, :category => ["technology", "entertainment"], :exclude => ["politics"])

Available parameter options are `:rpp`, `:page`, `:since_id`, `:format`, `:callback`, `:category`, and `:exclude`. The `:exclude` parameter simply excludes results from specified categories.

## Notes / Warning

* I classify this library unfinished, as I've spent less than 90 minutes working on it. More than 30 of those went to unsuccessfully getting `libxml-ruby` to parse Atom formatted XML. So for now it just returns the raw Atom/JSON response as a string. If you're good with XML and XPath in Ruby, please fork and fix :)

* I have not had time to test if it works properly as a Rails plugin yet, so be brave.