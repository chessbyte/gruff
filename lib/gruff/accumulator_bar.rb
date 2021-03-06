# frozen_string_literal: true

require 'gruff/base'

##
# A special bar graph that shows a single dataset as a set of
# stacked bars. The bottom bar shows the running total and
# the top bar shows the new value being added to the array.

class Gruff::AccumulatorBar < Gruff::StackedBar
  def draw
    raise(Gruff::IncorrectNumberOfDatasetsException) unless store.length == 1

    accum_array = store.data.first.points[0..-2].reduce([0]) { |a, v| a << a.last + v }
    data 'Accumulator', accum_array
    set_colors
    store.reverse!
    super
  end
end
