{
	programs.nixvim = {
		plugins.wilder = {
			enable = true;
      modes = [ ":" ]; # Available modes are ":" "/" "?"
      renderer = ''

        wilder.popupmenu_renderer(
          wilder.popupmenu_border_theme({
            border = 'rounded',
            empty_message = wilder.popupmenu_empty_message_with_spinner(),
            left = {
              ' ',
              wilder.popupmenu_devicons(),
              wilder.popupmenu_buffer_flags({
                flags = ' a + ',
                icons = {['+'] = '', a = '', h = ''},
              }),
            },
            right = {
              ' ',
              wilder.popupmenu_scrollbar(),
            },
          })
        )

      '';
		};
	};
}
