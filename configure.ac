[

]AC_INIT(
  [[Git Tree Digest]],
  m4_esyscmd_s([
    'sh' '-' 'build-aux/VERSION.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([VERSION.sh failed])]),
  [[quinn@quinngrier.com]],
  [[git-tree-digest]],
  [[https://www.quinngrier.com/git-tree-digest]])[

]gatbps_check_macros[ || 'exit' "${?}"

]GATBPS_DEFINE_VERSION(
  [AC_],
  [PACKAGE_VERSION])[

]GATBPS_DEFINE_DATE(
  [AC_],
  [PACKAGE_DATE],
  m4_esyscmd_s([
    'sh' '-' 'build-aux/DATE.sh'
  ])m4_if(m4_sysval, [0], [], [m4_fatal([DATE.sh failed])]))[

]m4_include([build-aux/CC0-1.0-AC-COPYRIGHT.ac])[

]AC_CONFIG_AUX_DIR([build-aux])[
]AC_CONFIG_MACRO_DIR([m4])[
]AC_CONFIG_MACRO_DIRS([m4])[
]AC_CONFIG_SRCDIR([doc/git-tree-digest.texi])[

]AM_INIT_AUTOMAKE([
  -Wall
  foreign
  nostdinc
  subdir-objects
  tar-ustar
])[

]DEFINE_ALL[

]dnl begin_includes
[

]dnl end_includes
[

]AC_CONFIG_FILES([Makefile])[

]AC_OUTPUT[

]
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
