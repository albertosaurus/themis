# Themis

[![Build Status](https://secure.travis-ci.org/TMXCredit/themis.png)](http://travis-ci.org/TMXCredit/themis)
[![Dependency Status](https://gemnasium.com/TMXCredit/themis.png)](https://gemnasium.com/TMXCredit/themis)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/TMXCredit/themis)

Modular and switchable validations for ActiveRecord models.
Works with Rails 3 and 4.

## Usage

### Define validation module

```ruby
module PersonValidation
  extend Themis::Validation

  validates_presence_of :first_name
  validates_presence_of :last_name
end
```

### Mix validation modules

```ruby
module UserValidation
  extend Themis::Validation

  # use all validators defined in PersonValidation
  include PersonValidation

  validates :email, :format => {:with /\A.*@.*\z/ }, :presence => true
  validate_presence_of :spouse, :if => :married?
end
```

### ActiveRecord model

#### Including validation modules in models:

You can include a validation module in a ActiveRecord model to apply to the model all validators
defined in the module:

```ruby
class User < ActiveRecord::Base
  include UserValidation
end
```

It's equivalent to:

```ruby
class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, :format => {:with /\A.*@.*\z/ }, :presence => true
  validate_presence_of :spouse, :if => :married?
end
```

#### Using has\_validation and use\_validation methods

You can define a number of validator sets for a model using the `.has_validation` method. So you can
choose with the `#use_validation` method which validator set to use depending on the context.

```ruby
class User < ActiveRecord::Base
  has_validation :soft, PersonValidation
  has_validation :hard, UserValidation
end

user = User.new
user.valid?                   # no validators are used
user.use_validation(:soft)
user.valid?                   # validate first_name and last_name
user.use_validation(:hard)
user.valid?                   # validate first_name, last_name, email and spouse(if user is married)

user.use_no_validation
user.valid?                   # no validators are used
```

#### has\_validation syntax

##### With module:

```ruby
has_validation :soft, SoftValidation
```

##### With block:

```ruby
has_validation :hard do |model|
  # you can include validation module within block as well
  model.include SoftValidation
  model.validate_presence_of :email
end
```

##### With module and block:

```ruby
# It's equivalent to the example above
has_validation :hard, SoftValidation do |model|
  model.validate_presence_of :email
end
```

##### Multiple validations with one block or module:

```ruby
# declare :soft and :hard validation
has_validation :soft, :hard, SoftValidation

# extended :hard validation
has_validation :hard do |model|
  model.validate_presence_of :email
end
```


##### Option `:default`:

```ruby
class User < ActiveRecord::Base
   has_validation :soft, PersonValidation, :default => true
end

user = User.new
user.themis_validation  # => :soft
```

##### Option `:nested`:

The `:nested` option causes the `use_validation` method to be called recursively on associations passed to it.
It receives a symbol or array of symbols with association names.

```ruby
class User < ActiveRecord::Base
  has_one :account
  has_validation :soft, PersonValidation, :nested => :account
end

class Account < ActiveRecord::Base
  has_validation :soft do |model|
    model.validates_presence_of :nickname
  end
end

user = User.first
user.themis_validation            # => nil
user.account.themis_validation    # => nil
user.use_validation(:soft)
user.themis_validation            # => :soft
user.account.themis_validation    # => :soft
```

#### Using use\_nested\_validation\_on method

If you don't want to repeat yourself with the `:nested` option:

```ruby
class User
  has_validation :none, NoneValidation, :nested => [:accounts, :preferences, :info]
  has_validation :soft, SoftValidation, :nested => [:accounts, :preferences, :info]
  has_validation :hard, HardValidation, :nested => [:accounts, :preferences, :info]
end
```

You can use `use_nested_validation_on` method:

```ruby
class User
  use_nested_validation_on :accounts, :preferences, :info
  has_validation :none, NoneValidation
  has_validation :soft, SoftValidation
  has_validation :hard, HardValidation
end
```

Also `use_nested_validation_on` supports deep nesting:

```ruby
class User
  use_nested_validation_on :preferences, :info => [:email, :history]
end
```

# Running specs

To run specs:

```
rake spec
```

To verify test coverage use SimpleCov with Ruby 1.9.3:

```
rvm use 1.9.3
bundle install
rake spec
$BROWSER ./coverage/index.html
```


## Credits

* [Potapov Sergey](https://github.com/greyblake)

## Copyright

Copyright (c) 2013 TMX Credit.
