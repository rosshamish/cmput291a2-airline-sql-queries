FILES=""
DEST=Documents/cmput291/a2

# schema
FILES="$FILES a2-schema.sql"

# test data
FILES="$FILES a2-data.sql"

# scratch query
FILES="$FILES scratch.sql"

# queries
for i in {1..10}
do
  FILES="$FILES $i.sql"
done

scp $FILES rhanders@ohaton.cs.ualberta.ca:$DEST
