VALAFLAGS =	\
	--pkg gtk+-2.0	\
	--pkg gmodule-2.0

AM_CPPFLAGS = \
	-DPACKAGE_DATADIR=\"$(datadir)/tagle\"	\
	$(TAGLE_CFLAGS)													\
	$(TAGLE_GTK_CFLAGS)											\
	-include $(CONFIG_HEADER)

noinst_PROGRAMS = tagle-id3-test

tagle_id3_test_SOURCES = tagle-id3-test.vala

LDADD = \
	$(TAGLE_LIBS) \
	$(TAGLE_GTK_LIBS)