.. _backups:

Backups
=======

A compressed copy of the world up is pushed the Glacier vault once a day using boto's glacier command. Access is controlled with the minecuna-backups IAM which is restricted to that vault.

If you need a copy of the backups get an IAM from George.


Installation
------------

Create a crontab entry for ``$HOME/config/backups.sh`` with the aws key and secret set via environment variables.

Install virtualenv, like so:

.. code-block:: bash

    sudo aptitude install python-virtualenv


Create a virtualenv and install boto into it:

.. code-block:: bash

    virtualenv boto_venv
    source boto_venv/bin/activate
    pip install boto


Design
------

Each backup run takes a copy of the minecraft directory to avoid tar falling over when a file is updated. The directory it's copied into is cleaned before and after the backup to make sure we don't contaminate the backup. Next this copy is compressed with ``tar`` and ``xz``. Tar to make a single file and xz to because it's creates very small files and dammit Jim space doesn't grow on trees.

Finally we push this archive to Glacier.


Retrieval
---------

TODO...
