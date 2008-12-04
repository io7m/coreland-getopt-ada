#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "getopt-ada-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "getopt.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "getopt.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "getopt.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "getopt.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "getopt.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "getopt.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "getopt-ada.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "getopt-ada.a", "libgetopt-ada.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "getopt-ada-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "getopt-ada-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
