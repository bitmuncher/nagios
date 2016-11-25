# nagios
My Nagios Plugins

## check_gluster.pl

This plugin needs sudo privileges for nagios/nrpe user to run 'gluster'.

Usage: check_gluster.pl -v &lt;volume&gt; -n &lt;expected number of bricks&gt;