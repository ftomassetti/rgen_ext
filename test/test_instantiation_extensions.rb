require 'helper'

class InstantiationExtensionsTest < Test::Unit::TestCase
  
  module TestMetamodel

    class Dog < RGen::MetamodelBuilder::MMBase
      class << self
        include RGen::Ext::InstantiationExtensions
      end
      has_attr 'name',String
    end 

    class Person < RGen::MetamodelBuilder::MMBase
      class << self
        include RGen::Ext::InstantiationExtensions
      end
      has_attr 'first_name', String
      has_attr 'surname', String
      has_attr 'age', Integer
    end

  end
   
  def setup
  end

  def test_build_single_attribute
    dog = TestMetamodel::Dog.build('fuffy')
    assert_equal 'fuffy',dog.name
  end

  def test_build_multiple_attributes
    person = TestMetamodel::Person.build(:first_name => 'Luca', :surname => 'Gillus', :age => 23)
    assert_equal 'Luca',person.first_name
    assert_equal 'Gillus',person.surname
    assert_equal 23,person.age
  end

end
