#include <leptonica/allheaders.h>

int main() {
  char *versionStrP;
  versionStrP = getLeptonicaVersion();
  printf("%s\n", versionStrP);
  lept_free(versionStrP);
  
  versionStrP = getImagelibVersions();
  printf("  %s\n", versionStrP);
  lept_free(versionStrP);
  return 0;
}
