# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "themis"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Potapov Sergey"]
  s.date = "2012-08-24"
  s.description = "Flexible and modular validations for ActiveRecord models"
  s.email = ["blake131313@gmail.com"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
    "lib/themis.rb",
    "lib/themis/ar.rb",
    "lib/themis/ar/base_extension.rb",
    "lib/themis/ar/has_validation_method.rb",
    "lib/themis/ar/model_proxy.rb",
    "lib/themis/ar/use_validation_method.rb",
    "lib/themis/ar/validation_set.rb",
    "lib/themis/engine.rb",
    "lib/themis/validation.rb",
    "lib/themis/validation/validator.rb",
    "lib/themis/version.rb"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "Flexible and modular validations for ActiveRecord models"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.11"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<gemfury>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.11"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<gemfury>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.11"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<gemfury>, [">= 0"])
  end
end

