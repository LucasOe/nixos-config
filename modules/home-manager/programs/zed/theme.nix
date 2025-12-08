{ config, ... }:

{
  programs.zed-editor = {
    themes = {
      # https://zed.dev/schema/themes/v0.2.0.json
      # https://github.com/zed-industries/zed/blob/main/assets/themes/one/one.json
      "Stylix" = with config.lib.stylix.colors; {
        name = "Stylix";
        author = "LucasOe";
        themes = [
          {
            name = "Stylix";
            appearance = "dark";
            style = {
              "border" = "#${base03}";
              "border.variant" = "#${base01}";
              "border.focused" = null;
              "border.selected" = null;
              "border.transparent" = null;
              "border.disabled" = null;
              "elevated_surface.background" = "#${base01}";
              "surface.background" = "#${base00}";
              "background" = "#${base00}";
              "element.background" = "#${base00}";
              "element.hover" = "#${base01}";
              "element.active" = "#${base02}";
              "element.selected" = "#${base02}";
              "element.disabled" = "#${base03}";
              "drop_target.background" = "#${base03}";
              "ghost_element.background" = "#00000000";
              "ghost_element.hover" = "#${base02}";
              "ghost_element.active" = "#${base02}";
              "ghost_element.selected" = "#${base02}";
              "ghost_element.disabled" = "#${base03}";
              "text" = "#${base06}";
              "text.muted" = "#${base05}";
              "text.placeholder" = "#${base04}";
              "text.disabled" = "#${base04}";
              "text.accent" = "#${base0D}";
              "icon" = "#${base05}";
              "icon.muted" = "#${base03}";
              "icon.disabled" = "#${base03}";
              "icon.placeholder" = "#${base03}";
              "icon.accent" = "#${base0D}";
              "status_bar.background" = "#${base01}";
              "title_bar.background" = "#${base01}";
              "title_bar.inactive_background" = "#${base01}";
              "toolbar.background" = "#${base00}";
              "tab_bar.background" = "#${base01}";
              "tab.inactive_background" = "#${base01}";
              "tab.active_background" = "#${base00}";
              "search.match_background" = "#${base02}";
              "search.active_match_background" = "#${base03}";
              "panel.background" = "#${base00}";
              "panel.focused_border" = null;
              "pane.focused_border" = "#${base00}";
              "scrollbar.thumb.background" = "#${base01}4c";
              "scrollbar.thumb.hover_background" = "#${base02}4c";
              "scrollbar.thumb.border" = "#00000000";
              "scrollbar.track.background" = "#00000000";
              "scrollbar.track.border" = "#00000000";
              "editor.foreground" = "#${base05}";
              "editor.background" = "#${base00}";
              "editor.gutter.background" = "#${base00}";
              "editor.subheader.background" = "#${base00}";
              "editor.active_line.background" = "#${base01}";
              "editor.highlighted_line.background" = "#${base02}";
              "editor.line_number" = "#${base03}";
              "editor.active_line_number" = "#${base05}";
              "editor.hover_line_number" = "#${base04}";
              "editor.invisible" = "#${base03}";
              "editor.wrap_guide" = "#${base01}";
              "editor.active_wrap_guide" = "#${base02}";
              "editor.document_highlight.read_background" = "#${base02}d3";
              "editor.document_highlight.write_background" = "#${base03}d3";
              "terminal.background" = "#${base00}";
              "terminal.foreground" = "#${base05}";
              "terminal.bright_foreground" = "#${base06}";
              "terminal.dim_foreground" = "#${base04}";
              "terminal.ansi.black" = "#${base00}";
              "terminal.ansi.bright_black" = "#${base03}";
              "terminal.ansi.dim_black" = "#${base03}";
              "terminal.ansi.red" = "#${base08}";
              "terminal.ansi.bright_red" = "#${base08}";
              "terminal.ansi.dim_red" = "#${base08}";
              "terminal.ansi.green" = "#${base0B}";
              "terminal.ansi.bright_green" = "#${base0B}";
              "terminal.ansi.dim_green" = "#${base0B}";
              "terminal.ansi.yellow" = "#${base0A}";
              "terminal.ansi.bright_yellow" = "#${base0A}";
              "terminal.ansi.dim_yellow" = "#${base0A}";
              "terminal.ansi.blue" = "#${base0D}";
              "terminal.ansi.bright_blue" = "#${base0D}";
              "terminal.ansi.dim_blue" = "#${base0D}";
              "terminal.ansi.magenta" = "#${base0E}";
              "terminal.ansi.bright_magenta" = "#${base0E}";
              "terminal.ansi.dim_magenta" = "#${base0E}";
              "terminal.ansi.cyan" = "#${base0C}";
              "terminal.ansi.bright_cyan" = "#${base0C}";
              "terminal.ansi.dim_cyan" = "#${base0C}";
              "terminal.ansi.white" = "#${base05}";
              "terminal.ansi.bright_white" = "#${base05}";
              "terminal.ansi.dim_white" = "#${base05}";
              "link_text.hover" = "#${base0D}";
              "version_control.added" = "#${base0B}ff";
              "version_control.modified" = "#${base0A}ff";
              "version_control.word_added" = "#${base0B}d3";
              "version_control.word_deleted" = "#${base0F}d3";
              "version_control.deleted" = "#${base00}ff";
              "version_control.conflict_marker.ours" = "#${base0B}1a";
              "version_control.conflict_marker.theirs" = "#${base0D}1a";
              "conflict" = "#${base0A}ff";
              "conflict.background" = "#${base00}1a";
              "conflict.border" = "#${base00}ff";
              "created" = "#${base0B}ff";
              "created.background" = "#${base0B}1a";
              "created.border" = "#${base0B}ff";
              "deleted" = "#${base08}ff";
              "deleted.background" = "#${base08}1a";
              "deleted.border" = "#${base00}ff";
              "error" = "#${base0F}ff";
              "error.background" = "#${base0F}1a";
              "error.border" = "#${base0F}ff";
              "hidden" = "#${base04}ff";
              "hidden.background" = "#${base04}1a";
              "hidden.border" = "#${base04}ff";
              "hint" = "#${base0D}ff";
              "hint.background" = "#${base0D}1a";
              "hint.border" = "#${base0D}ff";
              "ignored" = "#${base04}ff";
              "ignored.background" = "#${base04}1a";
              "ignored.border" = "#${base04}ff";
              "info" = "#${base0D}ff";
              "info.background" = "#${base0D}1a";
              "info.border" = "#${base0D}ff";
              "modified" = "#${base0A}ff";
              "modified.background" = "#${base0A}1a";
              "modified.border" = "#${base0A}ff";
              "predictive" = "#${base04}ff";
              "predictive.background" = "#${base04}1a";
              "predictive.border" = "#${base04}ff";
              "renamed" = "#${base0D}ff";
              "renamed.background" = "#${base0D}1a";
              "renamed.border" = "#${base0D}ff";
              "success" = "#${base0B}ff";
              "success.background" = "#${base0B}1a";
              "success.border" = "#${base0B}ff";
              "unreachable" = "#${base03}ff";
              "unreachable.background" = "#${base04}1a";
              "unreachable.border" = "#${base04}ff";
              "warning" = "#${base09}ff";
              "warning.background" = "#${base09}1a";
              "warning.border" = "#${base09}ff";
              "players" = [
                {
                  "cursor" = "#${base0D}";
                  "background" = "#${base04}20";
                  "selection" = "#${base04}30";
                }
                {
                  "cursor" = "#${base09}";
                  "background" = "#${base09}20";
                  "selection" = "#${base09}30";
                }
                {
                  "cursor" = "#${base0A}";
                  "background" = "#${base0A}20";
                  "selection" = "#${base0A}30";
                }
                {
                  "cursor" = "#${base0B}";
                  "background" = "#${base0B}20";
                  "selection" = "#${base0B}30";
                }
                {
                  "cursor" = "#${base0C}";
                  "background" = "#${base0C}20";
                  "selection" = "#${base0C}30";
                }
                {
                  "cursor" = "#${base0D}";
                  "background" = "#${base0D}20";
                  "selection" = "#${base0D}30";
                }
                {
                  "cursor" = "#${base0E}";
                  "background" = "#${base0E}20";
                  "selection" = "#${base0E}30";
                }
                {
                  "cursor" = "#${base0F}";
                  "background" = "#${base0F}20";
                  "selection" = "#${base0F}30";
                }
              ];
              "syntax" = {
                "attribute" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "boolean" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "comment" = {
                  "color" = "#${base04}";
                  "font_style" = "italic";
                  "font_weight" = null;
                };
                "comment.doc" = {
                  "color" = "#${base04}";
                  "font_style" = "italic";
                  "font_weight" = null;
                };
                "constant" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "constructor" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "embedded" = {
                  "color" = "#${base07}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "emphasis" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "emphasis.strong" = {
                  "color" = "#${base09}";
                  "font_style" = "italic";
                  "font_weight" = null;
                };
                "enum" = {
                  "color" = "#${base08}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "function" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "hint" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "keyword" = {
                  "color" = "#${base0E}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "label" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "link_text" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "link_uri" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "namespace" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "number" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "operator" = {
                  "color" = "#${base0C}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "predictive" = {
                  "color" = "#${base0D}";
                  "font_style" = "italic";
                  "font_weight" = null;
                };
                "preproc" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "primary" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "property" = {
                  "color" = "#${base08}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation.bracket" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation.delimiter" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation.list_marker" = {
                  "color" = "#${base08}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation.markup" = {
                  "color" = "#${base08}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "punctuation.special" = {
                  "color" = "#${base0F}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "selector" = {
                  "color" = "#${base0A}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "selector.pseudo" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "string" = {
                  "color" = "#${base0B}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "string.escape" = {
                  "color" = "#${base0E}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "string.regex" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "string.special" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "string.special.symbol" = {
                  "color" = "#${base09}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "tag" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "text.literal" = {
                  "color" = "#${base0B}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "title" = {
                  "color" = "#${base08}";
                  "font_style" = null;
                  "font_weight" = 400;
                };
                "type" = {
                  "color" = "#${base0A}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "variable" = {
                  "color" = "#${base05}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "variable.special" = {
                  "color" = "#${base0A}";
                  "font_style" = null;
                  "font_weight" = null;
                };
                "variant" = {
                  "color" = "#${base0D}";
                  "font_style" = null;
                  "font_weight" = null;
                };
              };
            };
          }
        ];
      };
    };
  };
}
