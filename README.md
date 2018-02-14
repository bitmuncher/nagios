# nagios
My Nagios Plugins

## check_gluster.pl

This plugin needs sudo privileges for nagios/nrpe user to run 'gluster'.

Usage: check_gluster.pl -v &lt;volume&gt; -n &lt;expected number of bricks&gt;

## check_ejabberd.pl

Simple plugin to check http-bind of eJabberd

## Beanstalk.pm

Updated version of original CPAN module Nagios::Plugin::Beanstalkd to use Monitoring::Plugin
