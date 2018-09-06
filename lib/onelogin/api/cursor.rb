# Cursor
#
# Used for paginating requests to the OneLogin API
#
# Returns an enumerable object
class Cursor
  include Enumerable

  # Create a new instance of the Cursor.
  #
  # @param url [String] The url of the API endpoint
  # @param options [Hash] Configuation options
  #
  def initialize(client, url, options = {})
    @client = client
    @url = url
    @options = options

    @model = options[:model]
    @headers = options[:headers] || {}
    @params = options[:params] || {}
    @max_results = options[:max_results]

    @collection = []
    @after_cursor = options.fetch(:after_cursor, nil)
  end

  def each(start = 0)
    return to_enum(:each, start) unless block_given?

    Array(@collection[start..-1]).each do |item|
      if @model
        yield(@model.new(item))
      else
        yield(item)
      end
    end

    unless last?
      start = [@collection.size, start].max

      fetch_next_page

      each(start, &Proc.new)
    end
  end

  private

  def fetch_next_page
    @params = @params.merge(after_cursor: @after_cursor) if @after_cursor

    response = @client.get(
      @url,
      headers: @headers,
      query: @params
    )

    json = response.parsed_response

    results = json['data'].flatten

    @collection += if results_remaining < results.size
      results.slice(0, results_remaining)
    else
      results
    end

    @after_cursor = after_cursor(json)
    @last_cursor_empty = @after_cursor.nil?
  end

  def after_cursor(json)
    return unless json['pagination']

    json['pagination'].fetch('after_cursor', nil)
  end

  def results_remaining
    @max_results - @collection.size
  end

  def fetch_completed?
    return false unless @max_results

    @collection.size >= @max_results
  end

  def last?
    @last_cursor_empty || fetch_completed?
  end
end
