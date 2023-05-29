local status, plugin = pcall(require, "mason")
if not status then
    vim.notify("没有找到 mason")
    return
end

require("mason").setup{
    log_level = vim.log.levels.INFO,
    registries = {
        "lua:mason-registry.index",
        "github:mason-org/mason-registry",
    },
    max_concurrent_installers = 4,
    providers = {
        "mason.providers.client",
        "mason.providers.registry-api",
    },

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template ="https://github.com/%s/releases/download/%s/%s",
    },
    on_config_done = nil,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}
