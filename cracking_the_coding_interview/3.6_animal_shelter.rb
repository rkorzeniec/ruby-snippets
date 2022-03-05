# frozen_string_literal: true

# An animal shelter, which holds only dogs and cats, operates on a strictly
# "first in, first out" basis.

# People must adopt either the "oldest" (based on arrival time) of all animals at the shelter,
# or they can select whether they would prefer a dog or a cat
# (and will receive the oldest animal of that type).

# They cannot select which specific animal they would like.
# Create the data structures to maintain this system and implement operations
# such as enqueue, dequeueAny, dequeueDog, and dequeueCat.

# You may use the built-in Linked list data structure.

require 'minitest/autorun'

Animal = Struct.new(:kind)
QueueItem = Struct.new(:animal, :timestamp, keyword_init: true)

class AnimalShelter
  def initialize
    @dogs = []
    @cats = []
  end

  def enqueue(animal)
    item = QueueItem.new(animal:, timestamp: Time.now.to_f.round(3)*1000)
    animal.kind == :dog ? dogs.append(item) : cats.append(item)
  end

  def dequeue
    # puts "dog #{dogs.first.timestamp} cat #{cats.first.timestamp}"
    return dequeue_cat if dogs.empty?
    return dequeue_dog if cats.empty?

    dogs.first.timestamp <= cats.first.timestamp ? dequeue_dog : dequeue_cat
  end

  def dequeue_dog
    dogs.shift.animal
  end

  def dequeue_cat
    cats.shift.animal
  end

  private

  attr_reader :dogs, :cats
end

class TestAnimalShelter < Minitest::Test
  def test_1
    dog1 = Animal.new(:dog)
    dog2 = Animal.new(:dog)
    dog3 = Animal.new(:dog)

    cat1 = Animal.new(:cat)
    cat2 = Animal.new(:cat)
    cat3 = Animal.new(:cat)
    cat4 = Animal.new(:cat)

    shelter = AnimalShelter.new

    shelter.enqueue(dog1)
    sleep(0.1)
    shelter.enqueue(cat1)
    sleep(0.1)
    shelter.enqueue(dog2)
    sleep(0.1)
    shelter.enqueue(dog3)
    sleep(0.1)
    shelter.enqueue(cat2)
    sleep(0.1)
    shelter.enqueue(cat3)
    sleep(0.1)
    shelter.enqueue(cat4)
    sleep(0.1)

    assert_equal 3, shelter.send(:dogs).size
    assert_equal 4, shelter.send(:cats).size

    assert_equal dog1, shelter.dequeue
    assert_equal cat1, shelter.dequeue

    assert_equal dog2, shelter.dequeue_dog
    assert_equal cat2, shelter.dequeue_cat

    assert_equal dog3, shelter.dequeue
    assert_equal cat3, shelter.dequeue
    assert_equal cat4, shelter.dequeue
  end
end
