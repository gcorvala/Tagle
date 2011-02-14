VALAFLAGS = \
	--pkg gtk+-2.0 \
	--pkg gmodule-2.0

AM_CPPFLAGS = \
	$(TAGLE_CFLAGS)			\
	$(TAGLE_GTK_CFLAGS)

bin_PROGRAMS = tagle		

tagle_SOURCES = main.vala

tagle_LDADD = \
	$(TAGLE_LIBS) \
	$(TAGLE_GTK_LIBS)
