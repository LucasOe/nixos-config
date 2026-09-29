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
                  };
                  "arithmetic" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "attribute" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "attributeBracket" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "bitwise" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "boolean" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "brace" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "bracket" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "builtinAttribute" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "builtinType" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "character" = {
                    "color" = base0B;
                    "font_style" = null;
                  };
                  "colon" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "comma" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "comment" = {
                    "color" = base04;
                    "font_style" = "italic";
                  };
                  "comment.doc" = {
                    "color" = base04;
                    "font_style" = "italic";
                  };
                  "comparison" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "const" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "constant" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "constant.builtin" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "constParameter" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "constructor" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "derive" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "deriveHelper" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "diff.minus" = {
                    "color" = base0F;
                    "font_style" = null;
                  };
                  "diff.plus" = {
                    "color" = base0B;
                    "font_style" = null;
                  };
                  "dot" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "embedded" = {
                    "color" = base07;
                    "font_style" = null;
                  };
                  "emphasis" = {
                    "color" = base0D;
                    "font_style" = "italic";
                  };
                  "emphasis.strong" = {
                    "color" = base09;
                    "font_style" = "italic";
                  };
                  "enum" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "enumMember" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "escapeSequence" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "formatSpecifier" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "function" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "generic" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "hint" = {
                    "color" = base03;
                    "font_style" = null;
                  };
                  "keyword" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "label" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "lifetime" = {
                    "color" = base05;
                    "font_style" = "italic";
                  };
                  "link_text" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "link_uri" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "logical" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "macro" = {
                    "color" = base0D;
                    "font_style" = "italic";
                  };
                  "macroBang" = {
                    "color" = base0E;
                    "font_style" = "italic";
                  };
                  "method" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "namespace" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "negation" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "number" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "operator" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "parameter" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "parenthesis" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "predictive" = {
                    "color" = base0D;
                    "font_style" = "italic";
                  };
                  "preproc" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "primary" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "procMacro" = {
                    "color" = base0D;
                    "font_style" = "italic";
                  };
                  "property" = {
                    "color" = base08;
                    "font_style" = null;
                  };
                  "punctuation" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "punctuation.bracket" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "punctuation.delimiter" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "punctuation.list_marker" = {
                    "color" = base08;
                    "font_style" = null;
                  };
                  "punctuation.special" = {
                    "color" = base0F;
                    "font_style" = null;
                  };
                  "selector" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "selector.pseudo" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "selfKeyword" = {
                    "color" = base09;
                    "font_style" = "italic";
                  };
                  "selfTypeKeyword" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "semi" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "static" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "string" = {
                    "color" = base0B;
                    "font_style" = null;
                  };
                  "string.escape" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "string.regex" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "string.special" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "string.special.symbol" = {
                    "color" = base0E;
                    "font_style" = null;
                  };
                  "struct" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "tag" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "tag.doctype" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "text.literal" = {
                    "color" = base0B;
                    "font_style" = null;
                  };
                  "title" = {
                    "color" = base08;
                    "font_style" = null;
                  };
                  "toolModule" = {
                    "color" = base0D;
                    "font_style" = null;
                  };
                  "trait" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "type" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "type.builtin" = {
                    "color" = base09;
                    "font_style" = null;
                  };
                  "typeAlias" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "typeParameter" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "union" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                  "unresolvedReference" = {
                    "color" = base0C;
                    "font_style" = null;
                  };
                  "variable" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "variable.parameter" = {
                    "color" = base05;
                    "font_style" = null;
                  };
                  "variable.special" = {
                    "color" = base0A;
                    "font_style" = "italic";
                  };
                  "variant" = {
                    "color" = base0A;
                    "font_style" = null;
                  };
                };
              };
            }
          ];
        };
    };

    # https://zed.dev/docs/semantic-tokens#customizing-token-colors
    #
    # Override Zeds Default Rust Grammar. Zed by default doesn't map all tokens.
    # https://github.com/zed-industries/zed/blob/main/crates/grammars/src/rust/semantic_token_rules.json
    userSettings = {
      global_lsp_settings = {
        semantic_token_rules =
          let
            mapToken = name: {
              token_type = name;
              style = [ name ];
            };
          in
          [
            # Map each token to its own name so it can be used in the syntax theme.
            # The full list of token can be found here:
            # https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/lsp/semantic_tokens.rs
            (mapToken "angle")
            (mapToken "arithmetic")
            (mapToken "attribute")
            (mapToken "attributeBracket")
            (mapToken "bitwise")
            (mapToken "boolean")
            (mapToken "brace")
            (mapToken "bracket")
            (mapToken "builtinAttribute")
            (mapToken "builtinType")
            (mapToken "character")
            (mapToken "colon")
            (mapToken "comma")
            (mapToken "comment")
            (mapToken "comparison")
            (mapToken "const")
            (mapToken "constParameter")
            (mapToken "derive")
            (mapToken "deriveHelper")
            (mapToken "dot")
            (mapToken "enum")
            (mapToken "enumMember")
            (mapToken "escapeSequence")
            (mapToken "formatSpecifier")
            (mapToken "function")
            (mapToken "generic")
            (mapToken "keyword")
            (mapToken "label")
            (mapToken "lifetime")
            (mapToken "logical")
            (mapToken "macro")
            (mapToken "macroBang")
            (mapToken "method")
            (mapToken "namespace")
            (mapToken "negation")
            (mapToken "number")
            (mapToken "operator")
            (mapToken "parameter")
            (mapToken "parenthesis")
            (mapToken "procMacro")
            (mapToken "property")
            (mapToken "punctuation")
            (mapToken "selfKeyword")
            (mapToken "selfTypeKeyword")
            (mapToken "semi")
            (mapToken "static")
            (mapToken "string")
            (mapToken "struct")
            (mapToken "toolModule")
            (mapToken "trait")
            (mapToken "typeAlias")
            (mapToken "typeParameter")
            (mapToken "union")
            (mapToken "unresolvedReference")
            (mapToken "variable")

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
