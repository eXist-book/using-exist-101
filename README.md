eXist Book - Using eXist 101 Chapter Example Code
==================================================

Code examples from the `Using eXist 101` chapter.

This chapter is intentionally kept seperate from the [other
example code](https://github.com/eXist-book/book-code) that accompanies the book
as it is felt that the reader should work through producing this code themselves
rather than installing it directly into the database.

For reference purposes, this repository is a backup of the collection `/db/apps/exist101`
from an eXist database.

To restore the backup you need to clone this Git repository
and then restore the backup. You will need to ensure that you
have [Git](http://git-scm.com) installed first.

```bash
git clone https://github.com/eXist-book/using-exist-101
cd using-exist-101
$EXIST_HOME/bin/backup.sh --user admin --password your-password -P "" --restore ./__contents.xml__
```
