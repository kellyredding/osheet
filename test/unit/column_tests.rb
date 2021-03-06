require "assert"
require "osheet/column"

require 'osheet/format/general'

class Osheet::Column

  class UnitTests < Assert::Context
    desc "Osheet::Column"
    before{ @c = Osheet::Column.new }
    subject{ @c }

    should be_a_styled_element
    should be_a_meta_element

    should have_reader :format
    should have_instance_methods :width
    should have_instance_methods :autofit, :autofit?
    should have_instance_methods :hidden, :hidden?

    should "set it's defaults" do
      assert_equal nil, subject.width
      assert_equal false, subject.autofit
      assert !subject.autofit?
      assert_equal false, subject.hidden
      assert !subject.hidden?
      assert_kind_of Osheet::Format::General, subject.format
    end

    should "set it's width" do
      subject.width(false)
      assert_equal false, subject.width

      subject.width(180)
      assert_equal 180, subject.width

      subject.width(nil)
      assert_equal 180, subject.width

      assert_equal 200, Osheet::Column.new(200).width
    end

    should "cast autofit and hidden to bool" do
      col = Osheet::Column.new
      col.autofit :true
      col.hidden 'false'

      assert_equal true, col.autofit
      assert_equal true, col.hidden
    end

  end

end
