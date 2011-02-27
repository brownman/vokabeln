require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  def new_lesson(attributes = {})
    attributes[:name] ||= "Welcome back to School!"
    lesson = Lesson.new(attributes)
    lesson.valid? # run validations
    lesson
  end

  def test_valid
    assert new_lesson.valid?
  end

  def test_require_name
    assert_equal ["can't be blank"], new_lesson(:name => "").errors[:name]
  end
end
