class CommentStripper
  def strip(input, markers)
    input.gsub(/\s*#{Regexp.union(markers)}.*$/, '')
  end
end
