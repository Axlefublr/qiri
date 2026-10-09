This repo contains my custom treesitter queries for helix :3

Helix will first read its “preset” runtime, which is stored relatively to where your *helix binary* is. Here's a visualizer:
```
hx
runtime/
   grammars/
   themes/
   queries/
      ada/
         folds.scm
         highlights.scm
         injections.scm
         locals.scm
         textobjects.scm
      ... other languages ...
      zig/
         highlights.scm
         indents.scm
         injections.scm
         locals.scm
         rainbows.scm
         tags.scm
         textobjects.scm
   tutor
```

If you compile helix from source, the best approach to get this going is to symlink the `runtime/` directory from where your helix binary is stored, to the `runtime/` directory in your locally cloned helix repo.

My helix binary is `~/fes/eva/hx`, and I store my local clone in `~/fes/ork/hx`, so I use the below ↓
```sh
rm -fr ~/fes/eva/runtime
ln -sf ~/fes/ork/hx/runtime ~/fes/eva
```

Now that you have this set up, you can *override* **particular** files in your *config*. `~/.config/helix/` repeats the similar structure:
```
~/.config/helix/runtime/
   grammars/
   themes/
   queries/
      fish/
         highlights.scm
   tutor
```

So! This repo is the `queries/` in the above visualization. I have this repo stored locally as `~/fes/ork/qiri`, so:
```sh
mkdir -p ~/.config/helix/runtime
ln -sf ~/fes/ork/qiri/ ~/.config/helix/runtime/queries
```

Realistically you won't want to use all of my queries wholesale; you'll probably want to pick particular files and yank them.
Put them in `~/.config/helix/runtime/`, not forgetting that each language needs to be stored in its own subdirectory.

---

Most of my queries can be used as is, but for some languages I use a custom parser. If something is not working, check what I'm using [in my config](https://github.com/Axlefublr/dotfiles/blob/main/helix/languages.toml).

# Contribution

Don't. This is mine. Feel totally free to take my work as a base and start your own repo though 😌
