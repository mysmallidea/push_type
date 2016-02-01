require 'test_helper'

module PushType
  class WysiwygFieldTest < ActiveSupport::TestCase

    class TestPage < PushType::Node
      field :foo, :wysiwyg
    end

    let(:node)  { TestPage.create FactoryGirl.attributes_for(:node, foo: val) }
    let(:val)   { 'abc' }
    let(:field) { node.fields[:foo] }
    
    it { field.form_helper.must_equal :text_area }
    it { field.html_options[:class].must_equal 'froala' }
    it { field.json_value.must_equal val }
    it { field.value.must_equal val }

    it { node.foo.must_equal val }
    
  end
end