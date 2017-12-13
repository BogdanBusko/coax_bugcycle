module SuggestionsHelper
  def block_suggestion(bugcycle ,user_id)
    count = 0
    bugcycle.suggestions.each do |suggestion|

      count += 1 if suggestion.user_id == user_id

      break if count > 0
    end

    return count > 0 ? false : true
  end
end
