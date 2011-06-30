git rm *.exe
git rm *.obj
git rm *.dll
git rm *.lst
git rm *.map
git rm *.pdb
git rm *.res

git rm *.EXE
git rm *.OBJ
git rm *.DLL
git rm *.LST
git rm *.MAP
git rm *.PDB
git rm *.RES

dir /s/b Debug > debuglist.txt
for /F %%T in (debuglist.txt) do rmdir /s /q %%T
dir /s/b Release > releaselist.txt
for /F %%T in (releaselist.txt) do rmdir /s /q %%T