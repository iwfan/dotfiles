source /usr/local/opt/asdf/libexec/asdf.fish

zoxide init fish | source

function starship_transient_prompt_func
  starship module character
end

function starship_transient_rprompt_func
  starship module time
end

starship init fish | source
enable_transience
