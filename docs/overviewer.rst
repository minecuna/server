.. _overviewer:

Overviewer
==========

The `map`_ is generated daily by the `overviewer project`_. The script, ``overviewer.sh``, is a bash script which runs the overviewer command daily in the early hours of the morning UTC and pushes the resulting output to the s3 bucket. The bucket is fronted by a cloudfront distribution which is invalidated on push.

`s3cmd`_ is used to push the overviewer output to s3 and puts each days html in its own directory.

Access to the s3 bucket and cloudfront distribution are controlled with the minecuna-overviewer IAM.


Installation
------------

Add the overviewer APT repo (``deb http://overviewer.org/debian ./``):

.. code:: bash

    sudo vim /etc/apt/sources.list
    wget -O - http://overviewer.org/debian/overviewer.gpg.asc | sudo apt-key add -


Update the apt cache and install:

.. code:: bash

    sudo aptitude update
    sudo aptitude install minecraft-overviewer


Edit the crontab and run the overviewer at 3:25am daily:

.. code:: bash

    25 3 * * * /home/minecuna/config/overviewer.sh


Textures
--------

We need the client textures for overviewer to be able to render them, running the update script should do everything you need:

.. code:: bash

    ./config/update-overviewer-textures.sh


However if this doesn't work, `check the docs`_.


.. _map: http://minecuna.co.uk
.. _overviewer project: http://docs.overviewer.org
.. _s3cmd: http://s3tools.org/s3cmd
.. _check the docs: http://docs.overviewer.org/en/latest/running/#installing-the-textures
