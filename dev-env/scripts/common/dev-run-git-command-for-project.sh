DIR="$(cd "$(dirname "$0")" && pwd)"

source $DIR/setenv.sh


echo .
echo .

echo     ********************************************************************************
echo     * Running git command for $1  
echo     *   - cd $2
ecoo     *   - git $3
echo     ********************************************************************************

cd $2

git $3
