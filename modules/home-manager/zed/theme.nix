{ nixosConfig, inputs, ... }:

{
  programs.zed-editor = {
    themes = {
      # https://zed.dev/theme-builder
      # https://zed.dev/schema/themes/v0.2.0.json
      # https://github.com/zed-industries/zed/blob/main/assets/themes/one/one.json
      # https://github.com/zed-industries/zed/blob/main/crates/settings_content/src/theme.rs#L506
      "NixOS Generated" =
        with nixosConfig.theme.colors.withHashtag;
        with inputs.nix-colorizer.hex;
        {
          name = "NixOS Generated";
          author = "LucasOe";
          themes = [
            {
              name = "NixOS Generated";
              appearance = "dark";
              style = {
                # Surface
                "background" = base01;
                "surface.background" = base00;
                "elevated_surface.background" = base00;
                "panel.background" = base00;
                "panel.focused_border" = "#00000000";
                "panel.indent_guide" = setAlpha base06 0.1;
                "panel.indent_guide_hover" = setAlpha base06 0.3;
                "panel.indent_guide_active" = setAlpha base06 0.3;
                "panel.overlay_background" = null;
                "panel.overlay_hover" = null;
                "pane.focused_border" = "#00000000";
                "pane.group_border" = "#00000000";
                # Border
                "border" = base02;
                "border.variant" = base02;
                "border.focused" = null;
                "border.selected" = null;
                "border.transparent" = null;
                "border.disabled" = null;
                # Text
                "text" = base06;
                "text.muted" = base05;
                "text.placeholder" = base04;
                "text.disabled" = base04;
                "text.accent" = base0D;
                "link_text.hover" = base0D;
                # Icon
                "icon" = base06;
                "icon.muted" = base05;
                "icon.disabled" = base04;
                "icon.accent" = base0D;
                # Editor
                "editor.foreground" = base05;
                "editor.background" = base00;
                "editor.gutter.background" = base00;
                "editor.active_line.background" = base02;
                "editor.highlighted_line.background" = null;
                "editor.subheader.background" = base01;
                "editor.active_line_number" = base05;
                "editor.line_number" = base03;
                "editor.hover_line_number" = base04;
                "editor.invisible" = setAlpha base06 0.1;
                "editor.wrap_guide" = setAlpha base06 0.1;
                "editor.active_wrap_guide" = setAlpha base06 0.3;
                "editor.indent_guide" = setAlpha base06 0.1;
                "editor.indent_guide_active" = setAlpha base06 0.3;
                "editor.document_highlight.read_background" = setAlpha base0D 0.2;
                "editor.document_highlight.write_background" = setAlpha base03 0.3;
                "editor.document_highlight.bracket_background" = null;
                "search.match_background" = null;
                "search.active_match_background" = null;
                # Navigation
                "status_bar.background" = base01;
                "title_bar.background" = base01;
                "title_bar.inactive_background" = base01;
                "toolbar.background" = base00;
                # Element
                "element.background" = base01;
                "element.hover" = base02;
                "element.active" = base02;
                "element.selected" = base02;
                "element.selection_background" = null;
                "element.disabled" = base01;
                # Ghost Element
                "ghost_element.background" = "#00000000";
                "ghost_element.disabled" = base02;
                "ghost_element.hover" = base02;
                "ghost_element.active" = base02;
                "ghost_element.selected" = base02;
                # Drop Target
                "drop_target.background" = setAlpha base03 0.5;
                "drop_target.border" = null;
                # Tabs
                "tab_bar.background" = base01;
                "tab.inactive_background" = base01;
                "tab.active_background" = base00;
                # Scrollbar
                "scrollbar.thumb.background" = setAlpha base05 0.3;
                "scrollbar.thumb.hover_background" = setAlpha base05 0.5;
                "scrollbar.thumb.active_background" = setAlpha base05 0.5;
                "scrollbar.thumb.border" = base02;
                "scrollbar.track.background" = "#00000000";
                "scrollbar.track.border" = base02;
                # Status
                "hint" = base0D;
                "hint.background" = setAlpha base0D 0.1;
                "hint.border" = darken base0D 0.4;
                "info" = base0C;
                "info.background" = setAlpha base0C 0.1;
                "info.border" = darken base0C 0.4;
                "success" = base0B;
                "success.background" = setAlpha base0B 0.1;
                "success.border" = darken base0B 0.4;
                "warning" = base0A;
                "warning.background" = setAlpha base0A 0.1;
                "warning.border" = darken base0A 0.4;
                "error" = base0F;
                "error.background" = setAlpha base0F 0.1;
                "error.border" = darken base0F 0.4;
                "created" = base0B;
                "created.background" = setAlpha base0B 0.1;
                "created.border" = darken base0B 0.4;
                "modified" = base0A;
                "modified.background" = setAlpha base0A 0.1;
                "modified.border" = darken base0A 0.4;
                "deleted" = base08;
                "deleted.background" = setAlpha base08 0.1;
                "deleted.border" = darken base08 0.4;
                "conflict" = base0A;
                "conflict.background" = setAlpha base0A 0.1;
                "conflict.border" = darken base0A 0.4;
                "renamed" = base0D;
                "renamed.background" = setAlpha base0D 0.1;
                "renamed.border" = darken base0D 0.4;
                "hidden" = base03;
                "hidden.background" = setAlpha base03 0.1;
                "hidden.border" = darken base03 0.4;
                "ignored" = base03;
                "ignored.background" = setAlpha base03 0.1;
                "ignored.border" = darken base03 0.4;
                "predictive" = base0E;
                "predictive.background" = setAlpha base0E 0.1;
                "predictive.border" = darken base0E 0.4;
                "unreachable" = base03;
                "unreachable.background" = setAlpha base03 0.1;
                "unreachable.border" = darken base03 0.4;
                # Version Control
                "version_control.added" = base0B;
                "version_control.deleted" = base08;
                "version_control.modified" = base0A;
                "version_control.renamed" = base0D;
                "version_control.conflict" = base0A;
                "version_control.ignored" = base03;
                "version_control.word_added" = setAlpha (darken base0B 0.1) 0.3;
                "version_control.word_deleted" = setAlpha (darken base0F 0.1) 0.3;
                "version_control.conflict_marker.ours" = setAlpha base0B 0.1;
                "version_control.conflict_marker.theirs" = setAlpha base0D 0.1;
                # Terminal
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
                # Players
                "players" = [
                  {
                    "cursor" = base0D;
                    "background" = base0D;
                    "selection" = setAlpha base0D 0.25;
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
                # Syntax
                # https://zed.dev/docs/extensions/languages#syntax-highlighting
                "syntax" = {
                  "angle" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "arithmetic" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "attribute" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "attributeBracket" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "bitwise" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "boolean" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "brace" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "bracket" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "builtinAttribute" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "builtinType" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "character" = {
                    "color" = base0B;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "colon" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "comma" = {
                    "color" = base05;
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
                  "comparison" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "const" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "constant" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "constant.builtin" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "constParameter" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "constructor" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "derive" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "deriveHelper" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "dot" = {
                    "color" = base05;
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
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "emphasis.strong" = {
                    "color" = base09;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "enum" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "enumMember" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "escapeSequence" = {
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "formatSpecifier" = {
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "function" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "generic" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "hint" = {
                    "color" = base03;
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
                  "lifetime" = {
                    "color" = base05;
                    "font_style" = "italic";
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
                  "logical" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "macro" = {
                    "color" = base0D;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "macroBang" = {
                    "color" = base0E;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "method" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "namespace" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "negation" = {
                    "color" = base0C;
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
                  "parameter" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "parenthesis" = {
                    "color" = base05;
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
                  "procMacro" = {
                    "color" = base0D;
                    "font_style" = "italic";
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
                  "selfKeyword" = {
                    "color" = base09;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "selfTypeKeyword" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "semi" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "static" = {
                    "color" = base05;
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
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "string.special.symbol" = {
                    "color" = base0E;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "struct" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "tag" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "tag.doctype" = {
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
                  "toolModule" = {
                    "color" = base0D;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "trait" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "type" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "type.builtin" = {
                    "color" = base09;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "typeAlias" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "typeParameter" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "union" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "unresolvedReference" = {
                    "color" = base0C;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variable" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variable.parameter" = {
                    "color" = base05;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                  "variable.special" = {
                    "color" = base0A;
                    "font_style" = "italic";
                    "font_weight" = null;
                  };
                  "variant" = {
                    "color" = base0A;
                    "font_style" = null;
                    "font_weight" = null;
                  };
                };
              };
            }
          ];
        };
    };

    # https://zed.dev/docs/semantic-tokens#customizing-token-colors
    #
    # Override Zeds Default Rust Grammar
    # https://github.com/zed-industries/zed/blob/main/crates/grammars/src/rust/semantic_token_rules.json
    # https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/lsp/semantic_tokens.rs
    userSettings = {
      global_lsp_settings = {
        semantic_token_rules = [
          {
            token_type = "angle";
            style = [ "angle" ];
          }
          {
            token_type = "arithmetic";
            style = [ "arithmetic" ];
          }
          {
            token_type = "attribute";
            style = [ "attribute" ];
          }
          {
            token_type = "attributeBracket";
            style = [ "attributeBracket" ];
          }
          {
            token_type = "bitwise";
            style = [ "bitwise" ];
          }
          {
            token_type = "boolean";
            style = [ "boolean" ];
          }
          {
            token_type = "brace";
            style = [ "brace" ];
          }
          {
            token_type = "bracket";
            style = [ "bracket" ];
          }
          {
            token_type = "builtinAttribute";
            style = [ "builtinAttribute" ];
          }
          {
            token_type = "builtinType";
            style = [ "builtinType" ];
          }
          {
            token_type = "character";
            style = [ "character" ];
          }
          {
            token_type = "colon";
            style = [ "colon" ];
          }
          {
            token_type = "comma";
            style = [ "comma" ];
          }
          {
            token_type = "comment";
            style = [ "comment" ];
          }
          {
            token_type = "comparison";
            style = [ "comparison" ];
          }
          {
            token_type = "const";
            style = [ "const" ];
          }
          {
            token_type = "constParameter";
            style = [ "constParameter" ];
          }
          {
            token_type = "derive";
            style = [ "derive" ];
          }
          {
            token_type = "deriveHelper";
            style = [ "deriveHelper" ];
          }
          {
            token_type = "dot";
            style = [ "dot" ];
          }
          {
            token_type = "enum";
            style = [ "enum" ];
          }
          {
            token_type = "enumMember";
            style = [ "enumMember" ];
          }
          {
            token_type = "escapeSequence";
            style = [ "escapeSequence" ];
          }
          {
            token_type = "formatSpecifier";
            style = [ "formatSpecifier" ];
          }
          {
            token_type = "function";
            style = [ "function" ];
          }
          {
            token_type = "generic";
            style = [ "generic" ];
          }
          {
            token_type = "label";
            style = [ "label" ];
          }
          {
            token_type = "lifetime";
            style = [ "lifetime" ];
          }
          {
            token_type = "logical";
            style = [ "logical" ];
          }
          {
            token_type = "macro";
            style = [ "macro" ];
          }
          {
            token_type = "macroBang";
            style = [ "macroBang" ];
          }
          {
            token_type = "method";
            style = [ "method" ];
          }
          {
            token_type = "namespace";
            style = [ "namespace" ];
          }
          {
            token_type = "negation";
            style = [ "negation" ];
          }
          {
            token_type = "number";
            style = [ "number" ];
          }
          {
            token_type = "operator";
            style = [ "operator" ];
          }
          {
            token_type = "parameter";
            style = [ "parameter" ];
          }
          {
            token_type = "parenthesis";
            style = [ "parenthesis" ];
          }
          {
            token_type = "procMacro";
            style = [ "procMacro" ];
          }
          {
            token_type = "property";
            style = [ "property" ];
          }
          {
            token_type = "punctuation";
            style = [ "punctuation" ];
          }
          {
            token_type = "selfKeyword";
            style = [ "selfKeyword" ];
          }
          {
            token_type = "selfTypeKeyword";
            style = [ "selfTypeKeyword" ];
          }
          {
            token_type = "semi";
            style = [ "semi" ];
          }
          {
            token_type = "static";
            style = [ "static" ];
          }
          {
            token_type = "string";
            style = [ "string" ];
          }
          {
            token_type = "struct";
            style = [ "struct" ];
          }
          {
            token_type = "toolModule";
            style = [ "toolModule" ];
          }
          {
            token_type = "trait";
            style = [ "trait" ];
          }
          {
            token_type = "typeAlias";
            style = [ "typeAlias" ];
          }
          {
            token_type = "typeParameter";
            style = [ "typeParameter" ];
          }
          {
            token_type = "union";
            style = [ "union" ];
          }
          {
            token_type = "unresolvedReference";
            style = [ "unresolvedReference" ];
          }
          {
            token_type = "variable";
            style = [ "variable" ];
          }
          {
            token_type = "keyword";
            style = [ "keyword" ];
          }

          # Special
          {
            token_type = "variable";
            token_modifiers = [ "mutable" ];
            underline = true;
          }
        ];
      };
    };
  };
}
