#!/usr/bin/perl -w

use WWW::Mechanize;

my $server = 'localhost';
my $url = 'http://servername/http-bind/';

my $message = '';
my $mailserver = 'localhost';
my $mail_from_addr = 'root@'.$server;
my $admin_email = 'root@foobar.com';

sub send_mail_to_admin
{
    my ($message) = @_;
    my $smtp = Net::SMTP->new($mailserver,
                              Hello => 'localhost',
                              Timeout => 60);
    $smtp->mail($mail_from_addr);
    $smtp->recipient($admin_email);
    $smtp->data;
    $smtp->datasend("Subject: Alert from ejabberd Monitoring");
    $smtp->datasend("\n");
    $smtp->datasend($message);
    $smtp->dataend;
    $smtp->quit;
}

my $mech = WWW::Mechanize->new();
$mech->get($url);
my $content = $mech->content();

if($content =~ /Ejabberd mod_http_bind/) {
    $message = "All is fine with ejabberd http-bind on ".$server.".\n";
} else {
    $message = "Something is wrong with http-bind on ".$server.".\n";
    $message .= "Please inspect the server.\n";
    &send_mail_to_admin($message);
}

print $message;
