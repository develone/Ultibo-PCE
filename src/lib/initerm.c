/*****************************************************************************
 * pce                                                                       *
 *****************************************************************************/

/*****************************************************************************
 * File name:   src/lib/initerm.c                                            *
 * Created:     2008-10-21 by Hampa Hug <hampa@hampa.ch>                     *
 * Copyright:   (C) 2008 Hampa Hug <hampa@hampa.ch>                          *
 *****************************************************************************/

/*****************************************************************************
 * This program is free software. You can redistribute it and / or modify it *
 * under the terms of the GNU General Public License version 2 as  published *
 * by the Free Software Foundation.                                          *
 *                                                                           *
 * This program is distributed in the hope  that  it  will  be  useful,  but *
 * WITHOUT  ANY   WARRANTY,   without   even   the   implied   warranty   of *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU  General *
 * Public License for more details.                                          *
 *****************************************************************************/

/* $Id$ */


#include <config.h>

#include <lib/initerm.h>
#include <lib/log.h>
#include <libini/libini.h>

#include <terminal/terminal.h>


/*
 * Check if a terminal type is recognized
 */
static
int trm_is_valid (const char *str)
{
	if (strcmp (str, "null") == 0) {
		return (1);
	}

#ifdef PCE_X11_USE
	if (strcmp (str, "x11") == 0) {
		return (1);
	}
#endif

#ifdef PCE_SDL_USE
	if (strcmp (str, "sdl") == 0) {
		return (1);
	}
#endif

	return (0);
}

terminal_t *ini_get_terminal (ini_sct_t *ini, const char *def)
{
	unsigned   scale, scale_x, scale_y;
	int        mouse_x[2], mouse_y[2];
	const char *driver;
	ini_sct_t  *sct;
	terminal_t *trm;

	trm = NULL;

	sct = ini_next_sct (ini, NULL, "terminal");
	ini_get_string (sct, "driver", &driver, "null");

	if (def != NULL) {
		while ((sct != NULL) && (strcmp (def, driver) != 0)) {
			sct = ini_next_sct (ini, sct, "terminal");
			ini_get_string (sct, "driver", &driver, "null");
		}

		driver = def;
	}
	else {
		while ((sct != NULL) && (trm_is_valid (driver) == 0)) {
			sct = ini_next_sct (ini, sct, "terminal");
			ini_get_string (sct, "driver", &driver, "null");
		}

		if (sct == NULL) {
			driver = "null";
		}
	}

	pce_log_tag (MSG_INF, "TERM:", "driver=%s\n", driver);

	if (strcmp (driver, "x11") == 0) {
#ifdef PCE_X11_USE
		trm = xt_new (sct);

		if (trm == NULL) {
			pce_log (MSG_ERR, "*** setting up x11 terminal failed\n");
		}
#else
		pce_log (MSG_ERR, "*** terminal driver 'x11' not supported\n");
#endif
	}
	else if (strcmp (driver, "sdl") == 0) {
#ifdef PCE_SDL_USE
		trm = sdl_new (sct);

		if (trm == NULL) {
			pce_log (MSG_ERR, "*** setting up sdl terminal failed\n");
		}
#else
		pce_log (MSG_ERR, "*** terminal driver 'sdl' not supported\n");
#endif
	}
	else if (strcmp (driver, "null") == 0) {
		trm = null_new (sct);

		if (trm == NULL) {
			pce_log (MSG_ERR, "*** setting up null terminal failed\n");
		}
	}
	else {
		pce_log (MSG_ERR, "*** unknown terminal driver: %s\n", driver);
	}

	if (trm == NULL) {
		pce_log (MSG_ERR, "*** no terminal found\n");
		return (NULL);
	}

	ini_get_uint16 (sct, "scale", &scale, 1);
	ini_get_uint16 (sct, "scale_x", &scale_x, scale);
	ini_get_uint16 (sct, "scale_y", &scale_y, scale);

	trm_set_scale (trm, scale_x, scale_y);

	ini_get_sint16 (sct, "mouse_mul_x", &mouse_x[0], 1);
	ini_get_sint16 (sct, "mouse_div_x", &mouse_x[1], 1);
	ini_get_sint16 (sct, "mouse_mul_y", &mouse_y[0], 1);
	ini_get_sint16 (sct, "mouse_div_y", &mouse_y[1], 1);

	trm_set_mouse_scale (trm, mouse_x[0], mouse_x[1], mouse_y[0], mouse_y[1]);

	return (trm);
}