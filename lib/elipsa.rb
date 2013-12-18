# encoding: utf-8

require 'elipsa/version'

module Elipsa
  extend self

  # @param str [String]
  # @param options [Hash{Symbol=>Object}]
  # @option options [Integer] :length (80)
  #   The maximum length of the result string,
  #   including an ellipsis if present.
  # @option options [String] :symbol ('...')
  #   The string to use as an ellipsis symbol
  # @option options [Numeric] :ratio (7/8)
  #   The ratio of available space that the
  #   resulting string must fill, if truncated.
  #   This ensures that if a word-boundary is
  #   not found close enough to your length
  #   to make the result meaningful, the string
  #   is broken mid-word instead.
  def elipsa(str, options = {})
    max_length = options.fetch(:length) { 80 }
    return str if str.length < max_length

    symbol = options.fetch(:symbol) { '...' }
    available = max_length - symbol.length
    ratio = options.fetch(:ratio) { Rational(7, 8) }

    substr = str[/\A(.{1,#{available}})(?=\s+|$)/mu]

    if substr.nil? || Rational(substr.length, available) < ratio
      substr = str[0...available]
    end

    "#{substr}#{symbol}"
  end

  # Extend into a String, or
  # include globally into String
  module String
    # Passes self as first argument to Elipsa::elipsa
    # @see Elipsa::elipsa
    def elipsa(options = {})
      Elipsa::elipsa(self, options)
    end
  end
end
