local status_ok, silicon = pcall(require, "silicon")
if not status_ok then
	return
end

silicon.setup({
	output = "string",
	font = "Fira Code=16",
	theme = "Dracula",
})
