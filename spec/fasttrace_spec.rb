# frozen_string_literal: true

module TestModule
  def on_module
    'module method'
  end
end

class TestBaseClass
  def on_base
    'base class instance method'
  end
end

class TestClass < TestBaseClass
  include TestModule

  def self.on_class
    'class method'
  end

  def on_instance
    'instance method'
  end
end

RSpec.describe Fasttrace do
  it 'has a version number' do
    expect(Fasttrace::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Fasttrace::Trace).to be_a Class

    tp = Fasttrace::Trace.new('tmp/test.out')
    expect(tp).to be_a Fasttrace::Trace
    expect(tp.tracepoint).to be_a TracePoint

    tp.tracepoint.enable
    begin
      results = []
      test_class = TestClass.new

      def test_class.on_singleton
        'singleton method'
      end

      results << TestClass.on_class
      results << test_class.on_instance
      results << test_class.on_base
      results << test_class.on_module
      results << test_class.on_singleton
    ensure
      tp.tracepoint.disable
    end

    expect(results).to eq [
      'class method',
      'instance method',
      'base class instance method',
      'module method',
      'singleton method'
    ]
  end
end
