# ruby-foomatic

Ruby interface to the [Foomatic printer database](http://www.linuxfoundation.org/collaborate/workgroups/openprinting/databasefoomatic).

## Installation

```bash
$ apt-get install foomatic-db
```

```bash
$ gem install ruby-foomatic
```

## Usage

```ruby
require "foomatic"
foomatic = Foomatic::DB.open("/usr/share/foomatic/db")
foomatic.printers.each do |printer|
  puts printer.inspect
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
