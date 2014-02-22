#!/usr/bin/env ruby

class MyClass
  
  def method_missing(meth, *args, &block)
    name = meth
    self.class.send(:define_method, name.to_sym) do
       puts args
    end
  end

end

mc = MyClass.new
mc.test("this is pretty cool")
mc.test