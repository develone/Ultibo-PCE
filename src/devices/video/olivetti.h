/*****************************************************************************
 * pce                                                                       *
 *****************************************************************************/

/*****************************************************************************
 * File name:   src/devices/video/olivetti.h                                 *
 * Created:     2011-09-26 by Hampa Hug <hampa@hampa.ch>                     *
 * Copyright:   (C) 2011-2017 Hampa Hug <hampa@hampa.ch>                     *
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


#ifndef PCE_VIDEO_OLIVETTI_H
#define PCE_VIDEO_OLIVETTI_H 1


#include <chipset/e6845.h>
#include <devices/memory.h>
#include <devices/video/video.h>
#include <drivers/video/terminal.h>
#include <libini/libini.h>


typedef struct {
	video_t             video;
	e6845_t             crtc;

	mem_blk_t           *memblk;
	unsigned char       *mem;

	mem_blk_t           *regblk;
	unsigned char       *reg;

	terminal_t          *term;

	const unsigned char *font;
	const unsigned char *rgbi;
	const unsigned char *scrambler;

	unsigned long       clock;

	unsigned char       mod_cnt;

	unsigned char       pal[4];

	char                mono;

	char                blink;
	unsigned            blink_cnt;
	unsigned            blink_rate;
} m24_t;


m24_t *m24_new (unsigned long io, unsigned long addr);

video_t *m24_new_ini (ini_sct_t *sct);


#endif
