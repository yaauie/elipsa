# Elipsa

Elipsa is a tool for conditionally and smartly truncating a string to a
specific length. It pays attention to word-boundaries, and tries to give
you as much of the string as it can, while still fitting your parameters.

The name of this gem is derived from the Serbo-Croatian [`елипса`][elipsa],
which can be translated directly to English `ellipsis`.

[elipsa]: http://en.wiktionary.org/wiki/elipsa

## Installation

Add this line to your application's Gemfile:

    gem 'elipsa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elipsa

## Usage

`Elipsa` is a tool for conditionally and smartly truncating a string to a specific length. It pays attention to word-boundaries, and tries to give you as much of the string as it can, while still fitting your parameters.

``` ruby
require 'elipsa'
extend Elipsa # (note: `self` is `main`)

# it leaves short strings alone
elipsa("a short string", length: 20)
# => "a short string"

# and breaks at word-boundaries when it can
elipsa("a longer string that goes over the limit", length: 20)
# => "a longer string..."

# but never truncates too much
elipsa("supercalifragilisticexpialidocious", length: 20)
# => "supercalifragilis..."

# and it never chops when it doesn't need to.
elipsa("nineteen characters", length: 20)
# => "nineteen characters"
```

## Advanced Usage

### Length

The `:length` parameter is optional and defaults to 80 characters.

~~~ ruby
elipsa(lorem_ipsum)
# => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis semper..."

elipsa(lorem_ipsum, length: 25)
# => "Lorem ipsum dolor sit..."
~~~

### Symbol

The `:symbol` parameter is optional and defaults to the three-character sequence `...`.

~~~ ruby
elipsa(lorem_ipsum, length: 20)
# => "Lorem ipsum..."

elipsa(lorem_ipsum, symbol: '…', length: 20)
# => "Lorem ipsum dolor…"
~~~

### Ratio

The `:ratio` parameter is option and defaults to the rational `7/8`. This parameter helps elipsa know when to abandon word-boundary splitting and just show as much as possible. If word-split-lenght:desired-length ratio falls below the `:ratio`, word-split is not used.

~~~ ruby
# without ratio support, too much could get truncated when there is no
# word boundary near the desired length.
elipsa("the word is supercalifragilisticexpialidocious", length: 40, ratio: 0)
# => "the word is..."

elipsa("merge branch feature/ISSUE-12345/fix-important-issue", length: 40)
# => "the word is supercalifragilisticexpia..."
~~~

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
