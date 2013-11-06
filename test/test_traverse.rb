require 'helper'

class TraverseTest < Test::Unit::TestCase
  
	class C < RGen::MetamodelBuilder::MMBase
      	include RGen::Ext::NavigationExtensions
		has_attr 'id',Integer
	end

	class D < RGen::MetamodelBuilder::MMBase
      	include RGen::Ext::NavigationExtensions
		has_attr 'id',Integer
		contains_one_uni  'c', C
	end

	class B < RGen::MetamodelBuilder::MMBase
      	include RGen::Ext::NavigationExtensions
		has_attr 'id',Integer
		contains_many_uni 'ds', D
	end

	class A < RGen::MetamodelBuilder::MMBase
      	include RGen::Ext::NavigationExtensions
		has_attr 'id',Integer
		contains_many_uni 'bs', B
		contains_one_uni  'c', C
	end

	def setup
		@d_1  = D.new({:id => 1  })
		@d_2  = D.new({:id => 2  })
		@d_3  = D.new({:id => 3  })
		@c_4  = C.new({:id => 4  })
		@c_5  = C.new({:id => 5  })
		@c_6  = C.new({:id => 6  })
		@b_7  = B.new({:id => 7  })
		@b_8  = B.new({:id => 8  })
		@b_9  = B.new({:id => 9  })
		@a_10 = A.new({:id => 10 })

		@d_1.c = @c_5

		@b_8.addDs @d_2
		@b_8.addDs @d_3
		@b_9.addDs @d_1	

		@a_10.addBs @b_9
		@a_10.addBs @b_8
		@a_10.c = @c_6
	end

	def assert_ids(expected,actual)
		assert_equal expected.count,actual.count
		expected.each do |e|
			assert actual.find {|a| a.id==e}, "Element with id #{e} not found"
		end
	end  

	def test_traverse
		l = []
		@a_10.traverse {|n| l<<n if n }
		assert_ids [10,6,8,9,2,3,1,5], l
	end

end