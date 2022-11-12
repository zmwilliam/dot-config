local Pkg = require "mason-core.package"
local _ = require "mason-core.functional"
local platform = require "mason-core.platform"
local std = require "mason-core.managers.std"
local git = require "mason-core.managers.git"
local path = require "mason-core.path"
local Optional = require "mason-core.optional"

return Pkg.new {
  name = "elixir-ls",
  desc = _.dedent [[
        A frontend-independent IDE "smartness" server for Elixir. Implements the "Language Server Protocol" standard and
        provides debugger support via the "Debug Adapter Protocol".
    ]],
  homepage = "https://github.com/elixir-lsp/elixir-ls",
  languages = { Pkg.Lang.Elixir },
  categories = { Pkg.Cat.LSP, Pkg.Cat.DAP },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    std.ensure_executable("mix", { help_url = "https://hexdocs.pm/mix/Mix.html" })

    local version = Optional.of("master")
    git.clone({ "https://github.com/elixir-lsp/elixir-ls", version = version }).with_receipt()

    ctx.spawn.mix { "deps.get" }
    ctx.spawn.mix { "compile" }
    ctx.spawn.mix { "elixir_ls.release", "-o", "release" }

    ctx:link_bin("elixir-ls",
      path.concat { "release", platform.is.win and "language_server.bat" or "language_server.sh" })
    ctx:link_bin("elixir-ls-debugger",
      path.concat { "release", platform.is.win and "debugger.bat" or "debugger.sh" })
  end,
}
