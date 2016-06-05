## Trailblazer note

### Basic Gemfile

```rb
# Gemfile
gem 'cells'
gem 'reform'
gem 'reform-rails'
gem 'trailblazer-rails'
```

### Concept template

```rb
class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model # not CRUD
    model Thing, :create # must have when include Model
    def process(params)
      Thing.create
    end
  end
end
```

### Reform template

```rb
class Thing < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include Model # not CRUD
    model Thing, :create # must have when include Model
    contract do
      property :name
      validate :name, presence: true
    end
    def process(params)
      validate(params[:thing]) do
        contract.save
      end
    end
  end
end
```

### Minitest

#### Gemfile

```rb
# Gemfile
group :test do
  gem 'minitest-rails'
  gem 'database_cleaner'
  gem 'minitest-around'
end
```

#### Install
```
bundle install
rails generate minitest:install
```
