local status_ok, dired = pcall(require, "dired")
if not status_ok then
  return
end

dired.setup({
  path_separator = "/",
  show_banner = false,
  show_hidden = true,
})
