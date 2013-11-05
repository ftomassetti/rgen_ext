require 'simplecov'
SimpleCov.start do
    add_filter "/test/"        
end

require 'rgen/metamodel_builder'
require 'rgen/ext'
require 'test/unit'
