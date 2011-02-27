# coding: utf-8

require 'test_helper'

class VocableTest < ActiveSupport::TestCase
  def new_vocable(attributes = {})
    attributes[:lesson_id] = lessons(:numbers).id unless attributes.key? :lesson_id
    attributes[:foreign] ||= "Cat"
    attributes[:translation] ||= "Katze"
    vocable = Vocable.new(attributes)
    vocable.valid? # run validations
    vocable
  end

  def test_valid
    assert new_vocable.valid?
  end

  def test_require_lesson
    assert_equal ["can't be blank"], new_vocable(:lesson_id => nil).errors[:lesson_id]
  end

  def test_require_foreign
    assert_equal ["can't be blank"], new_vocable(:foreign => "").errors[:foreign]
  end

  def test_require_translation
    assert_equal ["can't be blank"], new_vocable(:translation => "").errors[:translation]
  end

  def test_search_by_foreign
    results = Vocable.search("four")
    assert results.include?(vocables(:four))
    assert results.include?(vocables(:fourteen))
  end

  def test_search_by_translation
    results = Vocable.search("vier")
    assert results.include?(vocables(:four))
    assert results.include?(vocables(:fourteen))
  end

  def test_check_foreign
    vocable = vocables(:eleven)
    assert_equal true, vocable.check_foreign("eleven")
    assert_equal false, vocable.check_foreign("noidea")
    assert_equal 2, vocable.attempts.size
    assert_equal true, vocable.attempts[0].success
    assert_equal false, vocable.attempts[1].success
  end
end
