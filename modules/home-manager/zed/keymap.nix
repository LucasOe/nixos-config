{ ... }:

{
  programs.zed-editor = {
    # https://zed.dev/docs/key-bindings
    # Default Keybinds: https://github.com/zed-industries/zed/blob/main/assets/keymaps/default-linux.json
    # Actions: https://zed.dev/docs/all-actions
    userKeymaps = [
      {
        context = "Terminal && selection";
        bindings = {
          ctrl-c = "terminal::Copy";
        };
      }
    ];
  };
}
