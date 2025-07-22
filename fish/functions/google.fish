function google -d "Search with gemini" -a query
  if test (count $argv) -eq 0
    echo "Need a string to search for!"
    return 1
  end
  gemini -p "Make a google search about '$query' and summrize result as markdown format. Be concise!" | glow
end
