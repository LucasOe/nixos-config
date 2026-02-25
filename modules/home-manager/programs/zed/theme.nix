{ config, nix-colorizer, ... }:

{
  programs.zed-editor = {
    themes = {
      # https://zed.dev/schema/themes/v0.2.0.json
      # https://github.com/zed-industries/zed/blob/main/assets/themes/one/one.json
      "Stylix" =
        with config.lib.stylix.colors.withHashtag;
        with nix-colorizer.hex;
        {
          name = "Stylix";
          author = "LucasOe";
          themes = [
            {
              name = "Stylix";
              appearance = "dark";
              style = {
                "border" = base02;
                "border.variant" = base02;
                "border.focused" = null;
                "border.selected" = null;
                "border.transparent" = null;
                "border.disabled" = null;
                "elevated_surface.background" = base01;
                "surface.background" = base00;
                "background" = base00;
                "element.background" = base00;
                "element.hover" = base01;
                "element.active" = base02;
                "element.selected" = base02;
                "element.disabled" = base03;
                "drop_target.background" = base03;
                "ghost_element.background" = "#00000000";
                "ghost_element.hover" = base02;
                "ghost_element.active" = base02;
                "ghost_element.selected" = base02;
                "ghost_element.disabled" = base03;
                "text" = base06;
                "text.muted" = base05;
                "text.placeholder" = base04;
                "text.disabled" = base04;
                "text.accent" = base0D;
                "icon" = base05;
                "icon.muted" = base03;
                "icon.disabled" = base03;
                "icon.placeholder" = base03;
                "icon.accent" = base0D;
                "status_bar.background" = base01;
                "title_bar.background" = base01;
                "title_bar.inactive_background" = base01;
                "toolbar.background" = base00;
                "tab_bar.background" = base01;
                "tab.inactive_background" = base01;
                "tab.active_background" = base00;
                "search.match_background" = base02;
                "search.active_match_background" = base03;
                "panel.background" = base00;
                "panel.focused_border" = null;
                "pane.focused_border" = base00;
                "scrollbar.thumb.background" = setAlpha base05 0.3;
                "scrollbar.thumb.hover_background" = base02;
                "scrollbar.thumb.border" = base02;
                "scrollbar.track.background" = "#00000000";
                "scrollbar.track.border" = base02;
                "editor.foreground" = base05;
                "editor.background" = base00;
                "editor.gutter.background" = base00;
                "editor.subheader.background" = base00;
                "editor.active_line.background" = base01;
                "editor.highlighted_line.background" = base02;
                "editor.line_number" = base03;
                "editor.active_line_number" = base05;
                "editor.hover_line_number" = base04;
                "editor.invisible" = base03;
                "editor.wrap_guide" = base01;
                "editor.active_wrap_guide" = base02;
                "editor.document_highlight.read_background" = setAlpha base0D 0.1;
                "editor.document_highlight.write_background" = setAlpha base03 0.4;
                "terminal.background" = base00;
                "terminal.foreground" = base05;
                "terminal.bright_foreground" = base06;
                "terminal.dim_foreground" = base04;
                "terminal.ansi.black" = base00;
                "terminal.ansi.bright_black" = base03;
                "terminal.ansi.dim_black" = base03;
                "terminal.ansi.red" = base08;
                "terminal.ansi.bright_red" = base08;
                "terminal.ansi.dim_red" = base08;
                "terminal.ansi.green" = base0B;
                "terminal.ansi.bright_green" = base0B;
                "terminal.ansi.dim_green" = base0B;
                "terminal.ansi.yellow" = base0A;
                "terminal.ansi.bright_yellow" = base0A;
                "terminal.ansi.dim_yellow" = base0A;
                "terminal.ansi.blue" = base0D;
                "terminal.ansi.bright_blue" = base0D;
                "terminal.ansi.dim_blue" = base0D;
                "terminal.ansi.magenta" = base0E;
                "terminal.ansi.bright_magenta" = base0E;
                "terminal.ansi.dim_magenta" = base0E;
                "terminal.ansi.cyan" = base0C;
                "terminal.ansi.bright_cyan" = base0C;
                "terminal.ansi.dim_cyan" = base0C;
                "terminal.ansi.white" = base05;
                "terminal.ansi.bright_white" = base05;
                "terminal.ansi.dim_white" = base05;
                "link_text.hover" = base04;
                "version_control.added" = base0B;
                "version_control.modified" = base0A;
                "version_control.word_added" = setAlpha (darken base0B 0.1) 0.3;
                "version_control.word_deleted" = setAlpha base0F 0.8;
                "version_control.deleted" = base08;
                "version_control.conflict_marker.ours" = setAlpha base0B 0.1;
                "version_control.conflict_marker.theirs" = setAlpha base0D 0.1;
                "conflict" = base0A;
                "conflict.background" = setAlpha base0A 0.1;
                "conflict.border" = darken base0A 0.4;
                "created" = base0B;
                "created.background" = setAlpha base0B 0.1;
                "created.border" = darken base0B 0.4;
                "deleted" = base08;
                "deleted.background" = setAlpha base08 0.1;
                "deleted.border" = darken base08 0.4;
                "error" = base0F;
                "error.background" = setAlpha base0F 0.1;
                "error.border" = darken base0F 0.4;
                "hidden" = base03;
                "hidden.background" = setAlpha base03 0.1;
                "hidden.border" = darken base03 0.4;
                "hint" = base0D;
                "hint.background" = setAlpha base0D 0.1;
                "hint.border" = darken base0D 0.4;
                "ignored" = base03;
                "ignored.background" = setAlpha base03 0.1;
                "ignored.border" = darken base03 0.4;
                "info" = base0C;
                "info.background" = setAlpha base0C 0.1;
                "info.border" = darken base0C 0.4;
                "modified" = base0A;
                "modified.background" = setAlpha base0A 0.1;
                "modified.border" = darken base0A 0.4;
                "predictive" = base0E;
                "predictive.background" = setAlpha base0E 0.1;
                "predictive.border" = darken base0E 0.4;
                "renamed" = base0D;
                "renamed.background" = setAlpha base0D 0.1;
                "renamed.border" = darken base0D 0.4;
                "success" = base0B;
                "success.background" = setAlpha base0B 0.1;
                "success.border" = darken base0B 0.4;
                "unreachable" = base03;
                "unreachable.background" = setAlpha base03 0.1;
                "unreachable.border" = darken base03 0.4;
                "warning" = base0A;
                "warning.background" = setAlpha base0A 0.1;
                "warning.border" = darken base0A 0.4;
                "players" = [
                  {
                    "cursor" = base0D;
                    "background" = base04;
                    "selection" = setAlpha base04 0.25;
                  }
                  {
                    "cursor" = base09;
                    "background" = base09;
                    "selection" = setAlpha base09 0.25;
                  }
                  {
                    "cursor" = base0A;
                    "background" = base0A;
                    "selection" = setAlpha base0A 0.25;
                  }
                  {
                    "cursor" = base0B;
                    "background" = base0B;
                    "selection" = setAlpha base0B 0.25;
                  }
                  {
                    "cursor" = base0C;
                    "background" = base0C;
                    "selection" = setAlpha base0C 0.25;
                  }
                  {
                    "cursor" = base0D;
                    "background" = base0D;
                    "selection" = setAlpha base0D 0.25;
                  }
                  {
                    "cursor" = base0E;
                    "background" = base0E;
                    "selection" = setAlpha base0E 0.25;
                  }
                  {
                    "cursor" = base0F;
                    "background" = base0F;
                    "selection" = setAlpha base0F 0.25;
                  }
                ];
                "syntax" = {
                  "attribute" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "boolean" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "comment" = {
                    "color" = base04;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "comment.doc" = {
                    "color" = base04;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "constant" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "constructor" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "embedded" = {
                    "color" = base07;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "emphasis" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "emphasis.strong" = {
                    "color" = base09;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "enum" = {
                    "color" = base08;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "function" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "hint" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "keyword" = {
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "label" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "link_text" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "link_uri" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "namespace" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "number" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "operator" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "predictive" = {
                    "color" = base0D;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "preproc" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "primary" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "property" = {
                    "color" = base08;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation.bracket" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation.delimiter" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation.list_marker" = {
                    "color" = base08;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation.markup" = {
                    "color" = base08;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "punctuation.special" = {
                    "color" = base0F;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "selector" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "selector.pseudo" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string" = {
                    "color" = base0B;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string.escape" = {
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string.regex" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string.special" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string.special.symbol" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "tag" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "text.literal" = {
                    "color" = base0B;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "title" = {
                    "color" = base08;
                    "font_style" = null;
                    "font_weight" = 400;
                  };
                  "type" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variable" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variable.special" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variant" = {
                    "color" = base0D;
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
