/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 0;            /* border pixel of windows */
static const unsigned int snap      = 32;           /* snap pixel */
static const int showbar            = 0;            /* 0 means no bar */
static const int topbar             = 1;            /* 0 means bottom bar */
static const char *fonts[]          = {"LiterationMonoNerdFontMono-Bold:size=16" };
static const char dmenufont[]       = "LiterationMonoNerdFontMono-Bold:size=16";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class              instance  title  tags mask   isfloating   monitor */
	{ "firefox",          NULL,     NULL,  1 << 1,     0,           -1 },
	{ "Zathura-sandbox",  NULL,     NULL,  1 << 2,     0,           -1 },
        { "feh",              NULL,     NULL,  1 << 2,     0,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol	  arrange function */
	{ "[M]",	  monocle },
	{ "[]=",	  tile },	 /* first entry is default */
	{ "><>",	  NULL },	 /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY1 Mod1Mask
#define MODKEY4 Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY4,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY4|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY4|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY4|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *screenshot[] = { "scrot",
	"/home/yesyesbike/images/screenshot/%Y-%m-%d-%T.jpg", NULL};
static const char *slock[] = { "slock", NULL };
static const char *vol_tog[] = { "amixer", "sset", "Master", "toggle", NULL };
//static const char *vol_inc[] = { "amixer", "sset", "Master", "5%+", NULL };
//static const char *vol_dec[] = { "amixer", "sset", "Master", "5%-", NULL };
static const char *vol_inc[] = { "amixer", "sset", "Master", "5+", NULL };
static const char *vol_dec[] = { "amixer", "sset", "Master", "5-", NULL };
static const char *firefox[] = { "firefox", NULL };

static const Key keys[] = {
        /* modifier             key                       function        argument */
        { MODKEY4,              XK_q,                     spawn,          {.v = dmenucmd } },
        { MODKEY4,              XK_a,                     spawn,          {.v = termcmd } },
        { MODKEY4,              XK_e,                     togglebar,      {0} },
        { MODKEY4,              XK_j,                     focusstack,     {.i = +1 } },
        { MODKEY4,              XK_k,                     focusstack,     {.i = -1 } },
        { MODKEY4,              XK_i,                     incnmaster,     {.i = +1 } },
        { MODKEY4,              XK_o,                     incnmaster,     {.i = -1 } },
        { MODKEY4|ShiftMask,    XK_h,                     setmfact,       {.f = -0.05} },
        { MODKEY4|ShiftMask,    XK_l,                     setmfact,       {.f = +0.05} },
        { MODKEY4,              XK_Return,                zoom,           {0} },
        { MODKEY4,              XK_Tab,                   view,           {0} },
        { MODKEY4,              XK_c,                     killclient,     {0} },
        { MODKEY4,              XK_w,                     setlayout,      {.v = &layouts[0]} },
        { MODKEY4,              XK_s,                     setlayout,      {.v = &layouts[1]} },
        //{ MODKEY4,            XK_f,                     setlayout,      {.v = &layouts[2]} },
        { MODKEY4,              XK_space,                 setlayout,      {0} },
        { MODKEY4|ShiftMask,    XK_space,                 togglefloating, {0} },
        { MODKEY4,              XK_0,                     view,           {.ui = ~0 } },
        { MODKEY4|ShiftMask,    XK_0,                     tag,            {.ui = ~0 } },
        { MODKEY4,              XK_comma,                 focusmon,       {.i = -1 } },
        { MODKEY4,              XK_period,                focusmon,       {.i = +1 } },
        { MODKEY4|ShiftMask,    XK_comma,                 tagmon,         {.i = -1 } },
        { MODKEY4|ShiftMask,    XK_period,                tagmon,         {.i = +1 } },
        TAGKEYS(                XK_1,                                     0)
        TAGKEYS(                XK_2,                                     1)
        TAGKEYS(                XK_3,                                     2)
        TAGKEYS(                XK_4,                                     3)
        TAGKEYS(                XK_5,                                     4)
        TAGKEYS(                XK_6,                                     5)
        TAGKEYS(                XK_7,                                     6)
        TAGKEYS(                XK_8,                                     7)
        TAGKEYS(                XK_9,                                     8)
        TAGKEYS(                XK_0,                                     9)
        { MODKEY4|ShiftMask,    XK_q,                     quit,           {0} },

        { 0,                    XK_Print,                 spawn,          {.v = screenshot } },
        { 0,                    XK_Alt_R,                 spawn,          {.v = firefox} },
        { MODKEY4,              XK_l,                     spawn,          {.v = slock } },
        { 0,                    XF86XK_AudioMute,         spawn,          {.v = vol_tog} },
        { 0,                    XF86XK_AudioLowerVolume,  spawn,          {.v = vol_dec} },
        { 0,                    XF86XK_AudioRaiseVolume,  spawn,          {.v = vol_inc} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY4,        Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY4,        Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY4,        Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY4,        Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY4,        Button3,        toggletag,      {0} },
};

