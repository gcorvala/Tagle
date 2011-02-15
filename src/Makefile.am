VALAFLAGS =	\
	--vapidir vapi	\
	--pkg config		\
	--pkg gtk+-2.0	\
	--pkg gmodule-2.0

AM_CPPFLAGS = \
	-DPACKAGE_DATADIR=\"$(datadir)/tagle\"	\
	$(TAGLE_CFLAGS)													\
	$(TAGLE_GTK_CFLAGS)											\
	-include $(CONFIG_HEADER)

bin_PROGRAMS = tagle		

tagle_SOURCES = main.vala \
	tagle-logger.vala				\
	tagle-id3.vala \
	tagle-window.vala

tagle_LDADD = \
	$(TAGLE_LIBS) \
	$(TAGLE_GTK_LIBS)
