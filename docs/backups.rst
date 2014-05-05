.. _backups:

Backups
=======

A compressed copy of the world up is pushed the Glacier vault once a day using glaciercmd. Access is controlled with the minecuna-backups IAM which is restricted to that vault.

The script can be found in backups.sh and is deployed to ``/etc/crontab.d/backups``.

If you need a copy of the backups get an IAM from George.
