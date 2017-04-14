#!/usr/bin/env ruby
# Draws a pattern based on two arguments.
# First argument gives length of pattern.
# Second argument is optional and can be either allx or alt.
# An X pattern is drawn if second argument is not given.
class Pattern

  attr_accessor :dim, :type

  def initialize(dim, type)
    @dim = dim
    @type = type
  end

  def draw_x
    print "|X"
  end

  def draw_dot
    print "|."
  end

  # Draw the end-of-line edge
  def draw_edge
    print "|"
  end

  # Draws a given line number so that pattern is an x (default)
  def draw_line(number)
    @dim.times do |i|
      if i+1 == number || @dim-i == number
        print draw_x
      else
        print draw_dot
      end
    end
  end

  # Draws a line so that the pattern is all x or alternating x and dot
  def draw_alt_line
    @dim.times do |i|
      if i.even?
        print draw_x
      else
        if @type == "allx"
          print draw_x
        elsif @type == "alt"
          print draw_dot
        end
      end
    end
  end

  # Draw all lines of the pattern
  def draw_lines
    @dim.times do |i|
      if @type.nil?
        draw_line(i+1)
        draw_edge
        puts
      elsif @type == "allx" || @type == "alt"
        draw_alt_line
        draw_edge
        puts
      end
    end
  end

end

if ARGV[0].nil?
  puts "No arguments given"
  puts "First argument must be a number between 1 and 78"
  puts "Second argument is optional, it can be alt for alternating pattern, or allx to do an all x pattern."
else
  dim = ARGV[0].to_i
  type = ARGV[1] if !ARGV[1].nil?
  if dim != 0 && dim <= 78
    pattern = Pattern.new(dim, type)
    pattern.draw_lines
  else
    puts "First argument must be a number between 1 and 78"
  end
end


