.. _overviewer:

Overviewer
==========

The `map`_ is generated daily by the `overviewer project`_. The script, ``overviewer.sh``, is a bash script which runs the overviewer command daily in the early hours of the morning UTC and pushes the resulting output to the s3 bucket. The bucket is fronted by a cloudfront distribution which is invalidated on push.

`s3cmd`_ is used to push the overviewer output to s3 and puts each days html in its own directory.

Access to the s3 bucket and cloudfront distribution are controlled with the minecuna-overviewer IAM.

.. _map: http://minecuna.co.uk
.. _overviewer project: http://docs.overviewer.org
.. _s3cmd: http://s3tools.org/s3cmd
