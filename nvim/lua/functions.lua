local helpers = require 'helpers'

helpers.parse_from_definition_table{
  filetypedetect = {
    { "BufNewFile,BufRead", "*.tsx,*.jsx", "set filetype=typescriptreact" }
  };

  user_persistent_undo = {
    { "BufWritePre", [[/tmp/*]], "setlocal noundofile"}
  };
}
