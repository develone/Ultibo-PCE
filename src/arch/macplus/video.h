/*****************************************************************************
 * pce                                                                       *
 *****************************************************************************/

/*****************************************************************************
 * File name:   src/arch/macplus/video.h                                     *
 * Created:     2007-04-16 by Hampa Hug <hampa@hampa.ch>                     *
 * Copyright:   (C) 2007-2009 Hampa Hug <hampa@hampa.ch>                     *
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


#ifndef PCE_MACPLUS_VIDEO_H
#define PCE_MACPLUS_VIDEO_H 1


#include <terminal/terminal.h>


typedef struct {
	const unsigned char *vbuf;

	unsigned            w;
	unsigned            h;

	unsigned            cmp_cnt;

	unsigned char       *vcmp;

	unsigned char       *rgb;

	unsigned long       clk;
	unsigned long       clkacc;
	unsigned long       realclk;

	int                 realtime;

	terminal_t          *trm;

	unsigned char       vbi_val;
	void                *vbi_ext;
	void                (*set_vbi) (void *ext, unsigned char val);
} mac_video_t;


int mac_video_init (mac_video_t *mv, unsigned w, unsigned h);
mac_video_t *mac_video_new (unsigned w, unsigned h);

void mac_video_free (mac_video_t *mv);
void mac_video_del (mac_video_t *mv);

void mac_video_set_vbi_fct (mac_video_t *mv, void *ext, void *fct);

void mac_video_set_realtime (mac_video_t *mv, int realtime);

void mac_video_set_vbuf (mac_video_t *mv, const unsigned char *vbuf);
void mac_video_set_terminal (mac_video_t *mv, terminal_t *trm);

void mac_video_redraw (mac_video_t *mv);

void mac_video_clock (mac_video_t *mv, unsigned long cnt);


#endif
