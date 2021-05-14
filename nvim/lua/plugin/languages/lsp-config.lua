vim.fn.sign_define("LspDiagnosticsSignError", {
  texthl = "LspDiagnosticsSignError";
  numhl = "LspDiagnosticsSignError";
  text = emoji_icon.error;
})

vim.fn.sign_define("LspDiagnosticsSignWarning", {
  texthl = "LspDiagnosticsSignWarning";
  numhl = "LspDiagnosticsSignWarning";
  text = emoji_icon.warn;
})

vim.fn.sign_define("LspDiagnosticsSignHint", {
  texthl = "LspDiagnosticsSignHint";
  numhl = "LspDiagnosticsSignHint";
  text = emoji_icon.hint;
})

vim.fn.sign_define("LspDiagnosticsSignInformation", {
  texthl = "LspDiagnosticsSignInformation";
  numhl = "LspDiagnosticsSignInformation";
  text = emoji_icon.info;
})
