# Databases-Cw-3

- ssh into a DoC coputer using `ssh shell1.doc.ic.ac.uk` and enter password
- create cw2.sql file and paste contents from this repo: copy text to be pasted to clipboard. Then run `vim cw2.txt`, hit `v` to enable visual selection, use mouse wheel or arrow keys to select all the text, hit `d` to delete, then `i` to enter insert mode, and `ctrl+shift+v` to paste
- run `psql -h db.doc.ic.ac.uk -d family_history -U lab -W -f cw2.sql -o cw2out.txt` to run queries
- run `nano cw2out.txt` to see results

If you just want to type sql queries into the live shell, run `psql -h db.doc.ic.ac.uk -d family_history -U lab -W`
In the psql shell, when you are shown a faily large table, it will take you to a separate screen with just the table. To return to the shell hit `q`.
