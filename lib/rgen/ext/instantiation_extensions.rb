# RGen-ext
# Common extension to the RGen Framework
# Federico Tomassetti, 2013

require 'rgen/metamodel_builder'

module RGen
module Ext

module InstantiationExtensions

	def build(values={})
		instance = self.new
		if values.is_a? Hash
			values.each do |k,v|
				attribute = self.ecore.eAllAttributes.find {|x| x.name==k.to_s}
				reference = self.ecore.eAllReferences.find {|x| x.name==k.to_s}
				raise "UnexistingFeature #{k}" unless (attribute or reference)
				setter = (k.to_s+'=').to_sym
				instance.send setter, v
			end
		else
			raise "SingleAttributeRequired" if self.ecore.eAllAttributes.count!=1
			attribute = self.ecore.eAllAttributes[0]
			set_attr(instance,attribute,values)
		end
		instance
	end

	private

	def set_attr(instance,attribute,value)
		setter = (attribute.name+'=').to_sym
		instance.send setter, value
	end
end

end
end