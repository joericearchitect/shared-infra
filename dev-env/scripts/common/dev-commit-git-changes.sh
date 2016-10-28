DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh

echo     ********************************************************************************
echo     * Committing changes for git project.  All changes will be commited and pushed to master
echo     *   - Project Name:      $1
ecoo     *   - git repo location  $2
ecoo     *   - commit message:    $3
echo     ********************************************************************************

cd $2

echo        ********************************************************************************
echo          About to add.  Here is the status before adding and committing...
git status 

git add -A .

echo       .
echo       .
echo          Here is the status after adding, before committing.  Now about to commit
git status 

git commit -m "$3"

echo       .
echo       .
echo          Here is the status after committing.  Now about to push to master
git status 

git push origin master

echo       .
echo       .
echo          Here is the status after pushing.
git status 


echo        ********************************************************************************