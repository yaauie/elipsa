# Elipsa

TODO: Write a gem description

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
extend Elipsa

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
