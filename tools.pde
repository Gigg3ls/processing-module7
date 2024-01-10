
int[] loadInts(String filePath) {
String[] stringArray = loadStrings(filePath);
  int[] loadedInts = new int[stringArray.length];
 for (int i = 0; i < stringArray.length; i++) {
   loadedInts[i] = int(stringArray[i]);
 }
 for (int i = 0; i < loadedInts.length; i++) {
   println(loadedInts[i]);
 }
 return loadedInts;
}
